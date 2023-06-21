import UIKit
import MovieDatabaseAPI

final class SimilarCollectionContentView<Type: MediaProtocol>: UIView, UIContentView, UICollectionViewDelegate {

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
        return CGSize(width: screenSize.width, height: screenSize.height * 0.20)
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

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let configuration = configuration as? Configuration,
              let itemID = dataSource?.itemIdentifier(for: indexPath),
              let viewController = configuration.viewController else {
            return false
        }
        guard let mediaDetailViewController: MediaDetailViewController<Type> = mediaDetailViewController(
            itemID: itemID
        ) else { return false }
        viewController.navigationController?.pushViewController(mediaDetailViewController, animated: true)
        return false
    }
}

// MARK: - Methods

extension SimilarCollectionContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        updateSnapshot(configuration.itemIDs)
    }

    private func configureCollectionView() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.33),
            heightDimension: .fractionalHeight(1.0)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(
            top: Constants.spacing, leading: Constants.spacing, bottom: Constants.spacing, trailing: Constants.spacing
        )
        let section = NSCollectionLayoutSection(group: group)
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = Constants.collectionViewBackgroundColor
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

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func mediaDetailViewController(itemID: MediaItem.ID) -> MediaDetailViewController<Type>? {
        guard let configuration = configuration as? Configuration,
              let viewModel = configuration.viewModel,
              let detailViewModel = viewModel.mediaDetailViewModel(for: itemID),
              let similarViewModel: SimilarViewModel<Type> = viewModel.similarViewModel(for: itemID) else { return nil }
        let mediaDetailViewController = MediaDetailViewController(
            mediaDetailViewModel: detailViewModel,
            creditsViewModel: CreditsViewModel(),
            similarViewModel: similarViewModel
        )
        if let viewController = configuration.viewController as? MediaDetailViewController<Type>,
           let onUpdate = viewController.onUpdate {
            mediaDetailViewController.bind(onUpdate: onUpdate)
        }
        return mediaDetailViewController
    }
}

// MARK: - DataSource

extension SimilarCollectionContentView {
    enum Section {
        case main
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, MediaItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MediaItem.ID>

    private func cellRegistrationHandler(
        cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: MediaItem.ID
    ) {
        guard let configuration = configuration as? Configuration,
              let viewModel = configuration.viewModel,
              let mediaItem = viewModel.mediaItem(for: itemIdentifier) else { return }
        var contentConfiguration = cell.similarConfiguration()
        contentConfiguration.title = mediaItem.title
        if mediaItem.posterPath == nil {
            contentConfiguration.image = Constants.emptyImage
        }
        cell.contentConfiguration = contentConfiguration

        guard let posterPath = mediaItem.posterPath else { return }
        Task {
            let image = await viewModel.image(imageSize: .w500, imagePath: posterPath)
            if indexPath == collectionView?.indexPath(for: cell) {
                contentConfiguration.image = image
                await MainActor.run {
                    cell.contentConfiguration = contentConfiguration
                }
            }
        }
    }

    private func updateSnapshot(_ mediaItemIDs: [MediaItem.ID]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(mediaItemIDs)
        dataSource?.apply(snapshot)
    }
}

// MARK: - Configuration

extension SimilarCollectionContentView {
    struct Configuration: UIContentConfiguration {
        var viewModel: SimilarViewModel<Type>?
        var itemIDs: [MediaItem.ID] = []
        var viewController: UIViewController?

        func makeContentView() -> UIView & UIContentView {
            return SimilarCollectionContentView(self)
        }

        func updated(for state: UIConfigurationState) -> SimilarCollectionContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

private enum Constants {
    static let collectionViewBackgroundColor = UIColor.systemBackground
    static let spacing = CGFloat(10)
    static let emptyImage = UIImage(named: "Empty")
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    func similarMoviesCollectionConfiguration() -> SimilarCollectionContentView<Movie>.Configuration {
        return SimilarCollectionContentView<Movie>.Configuration()
    }

    func similarTVShowsCollectionConfiguration() -> SimilarCollectionContentView<TVShow>.Configuration {
        return SimilarCollectionContentView<TVShow>.Configuration()
    }
}
