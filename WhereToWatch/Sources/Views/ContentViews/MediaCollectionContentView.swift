import UIKit
import MovieDatabaseAPI

final class MediaCollectionContentView: UIView, UIContentView {

    // MARK: Properties

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        guard let screenSize = window?.windowScene?.screen.bounds.size else {
            return CGSize(width: 300, height: 300)
        }
        return CGSize(width: screenSize.width, height: screenSize.height * 0.30)
    }
    private var collectionView: UICollectionView?
    private var dataSource: DataSource?

    // MARK: View Lifecycle

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
}

// MARK: - Methods

extension MediaCollectionContentView {
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
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.isPagingEnabled = true
        collectionView?.delegate = self
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
        collectionView.backgroundColor = Constants.collectionViewBackgroundColor

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

// MARK: - DataSource

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
        if mediaItem.posterPath == nil {
            contentConfiguration.image = Constants.emptyPosterImage
        }
        cell.contentConfiguration = contentConfiguration

        guard let posterPath = mediaItem.posterPath else { return }
        Task {
            let image = await configuration.viewModel.image(imageSize: .w500, imagePath: posterPath)
            if indexPath == collectionView?.indexPath(for: cell) {
                contentConfiguration.image = image
                await MainActor.run {
                    cell.contentConfiguration = contentConfiguration
                }
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

// MARK: - UICollectionViewDelegate

extension MediaCollectionContentView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath
    ) {
        guard let configuration = configuration as? Configuration,
              indexPath.row == (configuration.itemIDs?.count ?? 0) - 1,
              let viewModel = configuration.viewModel as? SearchViewModel,
              let mediaType = configuration.mediaType else { return }
        switch mediaType {
        case .movie:
            Task {
                let itemIDs = await viewModel.fetchNextMoviePage()
                guard var configuration = self.configuration as? Configuration else { return }
                await MainActor.run {
                    configuration.itemIDs = itemIDs
                    self.configuration = configuration
                }
            }
        case .tvShow:
            Task {
                let itemIDs = await viewModel.fetchNextTVShowPage()
                guard var configuration = self.configuration as? Configuration else { return }
                await MainActor.run {
                    configuration.itemIDs = itemIDs
                    self.configuration = configuration
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let configuration = configuration as? Configuration,
              let mediaType = configuration.mediaType,
              let itemID = dataSource?.itemIdentifier(for: indexPath),
              let viewController = configuration.viewController else {
            return false
        }
        switch mediaType {
        case .movie:
            guard let mediaDetailViewController: MediaDetailViewController<Movie> = mediaDetailViewController(
                itemID: itemID, mediaType: mediaType
            ) else { return false }
            let navigationController = UINavigationController(rootViewController: mediaDetailViewController)
            viewController.present(navigationController, animated: true)
        case .tvShow:
            guard let mediaDetailViewController: MediaDetailViewController<TVShow> = mediaDetailViewController(
                itemID: itemID, mediaType: mediaType
            ) else { return false }
            let navigationController = UINavigationController(rootViewController: mediaDetailViewController)
            viewController.present(navigationController, animated: true)
        }
        return false
    }

    private func mediaDetailViewController<T: MediaProtocol>(
        itemID: MediaItem.ID, mediaType: MediaType
    ) -> MediaDetailViewController<T>? {
        guard let configuration = configuration as? Configuration,
              let detailViewModel = configuration.viewModel.mediaDetailViewModel(for: itemID, type: mediaType),
              let similarViewModel: SimilarViewModel<T> = configuration.viewModel.similarViewModel(
            for: itemID, type: mediaType
        ) else { return nil }
        return MediaDetailViewController(
            mediaDetailViewModel: detailViewModel,
            creditsViewModel: CreditsViewModel(),
            similarViewModel: similarViewModel
        )
    }
}

// MARK: - Configuration

extension MediaCollectionContentView {
    struct Configuration: UIContentConfiguration {
        let viewModel: MediaItemViewModelProtocol
        var mediaType: MediaType?
        var itemIDs: [MediaItem.ID]?
        var viewController: UIViewController?

        func makeContentView() -> UIView & UIContentView {
            return MediaCollectionContentView(self)
        }

        func updated(for state: UIConfigurationState) -> MediaCollectionContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension MediaCollectionContentView {
    private enum Constants {
        static let collectionViewBackgroundColor = UIColor.systemBackground
        static let spacing = CGFloat(10)
        static let emptyPosterImage = UIImage(named: "Empty")
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    func mediaCollectionContentView(viewModel: MediaItemViewModelProtocol) -> MediaCollectionContentView.Configuration {
        return MediaCollectionContentView.Configuration(viewModel: viewModel)
    }
}
