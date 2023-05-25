import UIKit

final class MediaCollectionContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: 300, height: 300)
    }
    private var collectionView: UICollectionView?
    private var dataSource: DataSource?

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureCollectionView()
        configureDataSource()
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        updateSnapshot(configuration.itemIDs ?? [])
    }

    private func configureCollectionView() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(Constants.spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: Constants.spacing, leading: Constants.spacing, bottom: Constants.spacing, trailing: Constants.spacing
        )
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.isPagingEnabled = true
    }

    private func configureDataSource() {
        guard let collectionView else { return }
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration, for: indexPath, item: itemIdentifier
                )
            }
        )
    }

    private func configureSubviews() {
        guard let collectionView else { return }
        collectionView.backgroundColor = .systemBackground

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MediaCollectionContentView {
    enum Section {
        case main
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, MediaItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MediaItem.ID>

    private func cellRegistrationHandler(
        cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: MediaItem.ID
    ) {
        guard let configuration = configuration as? Configuration,
              let mediaType = configuration.mediaType else { return }
        guard let mediaItem = configuration.viewModel.mediaItem(
                for: itemIdentifier, type: mediaType
              ) else {
            fatalError("Error: Not found MediaItem")
        }
        var contentConfiguration = cell.mediaContentView()
        contentConfiguration.title = mediaItem.title
        contentConfiguration.date = mediaItem.date
        contentConfiguration.genre = mediaItem.genre
        cell.contentConfiguration = contentConfiguration

        guard let posterPath = mediaItem.posterPath else { return }
        Task {
            let image = await configuration.viewModel.image(imageSize: .w500, imagePath: posterPath)
            if indexPath == collectionView?.indexPath(for: cell) {
                contentConfiguration.image = image
                cell.contentConfiguration = contentConfiguration
            }
        }
    }

    private func updateSnapshot(_ itemIDs: [MediaItem.ID]) {
        var snapShot = Snapshot()
        snapShot.appendSections([.main])
        snapShot.appendItems(itemIDs)
        dataSource?.apply(snapShot)
    }
}

extension MediaCollectionContentView {
    struct Configuration: UIContentConfiguration {
        let viewModel: MediaItemViewModelProtocol
        var mediaType: MediaType?
        var itemIDs: [MediaItem.ID]?

        func makeContentView() -> UIView & UIContentView {
            return MediaCollectionContentView(self)
        }

        func updated(for state: UIConfigurationState) -> MediaCollectionContentView.Configuration {
            return self
        }
    }
}

extension MediaCollectionContentView {
    private enum Constants {
        static let spacing = CGFloat(10)
    }
}

extension UICollectionViewCell {
    func mediaCollectionContentView(viewModel: MediaItemViewModelProtocol) -> MediaCollectionContentView.Configuration {
        return MediaCollectionContentView.Configuration(viewModel: viewModel)
    }
}
