import UIKit
import MovieDatabaseAPI

final class SearchListViewController<Type: MediaProtocol>: UICollectionViewController {

    // MARK: Properties

    private let searchListViewModel: SearchListViewModel<Type>
    private let collectionViewDelegate = SearchListViewControllerDelegate()
    private var dataSource: DataSource?

    // MARK: View Lifecycle

    init(searchListViewModel: SearchListViewModel<Type>) {
        self.searchListViewModel = searchListViewModel

        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        configuration.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)

        collectionViewDelegate.searchListCollectionViewDelegate = self
        collectionView.delegate = collectionViewDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewBackgroundColor

        configureDataSource()
        configureNavigationItem()
        updateSnapshot(searchListViewModel.mediaItemIDs)

        searchListViewModel.bind(onError: { errorMessage in
            print(errorMessage)
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let tabBarController {
            let tabBarHeight = tabBarController.tabBar.frame.size.height
            collectionView.contentInset.bottom = tabBarHeight
        }
        collectionView.contentInset.top = Constants.collectionViewContentInsetTop
    }
}

// MARK: - Methods

extension SearchListViewController {
    private func configureDataSource() {
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

    private func configureNavigationItem() {
        navigationItem.title = "\(searchListViewModel.query) (\(searchListViewModel.itemTotalCount))"
    }
}

// MARK: - DataSource

extension SearchListViewController {

    // MARK: Section

    enum Section {
        case main
    }

    // MARK: typealias

    typealias DataSource = UICollectionViewDiffableDataSource<Section, MediaItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MediaItem.ID>

    // MARK: CellRegistrationHandler

    private func cellRegistrationHandler(
        cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: MediaItem.ID
    ) {
        guard let mediaItem = searchListViewModel.mediaItem(for: itemIdentifier) else { return }

        var contentConfiguration = cell.mediaContentView()
        contentConfiguration.title = mediaItem.title
        contentConfiguration.date = mediaItem.date
        contentConfiguration.genre = mediaItem.genre
        contentConfiguration.image = Constants.emptyPosterImage?.resized(targetSize: Constants.posterImageSize)
        cell.contentConfiguration = contentConfiguration

        guard let posterPath = mediaItem.posterPath else { return }
        Task {
            let image = await searchListViewModel.image(imageSize: .w500, imagePath: posterPath)
            if indexPath == collectionView.indexPath(for: cell) {
                contentConfiguration.image = image?.resized(targetSize: Constants.posterImageSize)
                await MainActor.run {
                    cell.contentConfiguration = contentConfiguration
                }
            }
        }
    }

    // MARK: Snapshot

    private func updateSnapshot(_ itemIDs: [MediaItem.ID]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(itemIDs)
        dataSource?.apply(snapshot)
    }
}

// MARK: - SearchListCollectionViewDelegate

extension SearchListViewController: SearchListCollectionViewDelegate {
    func collectionView(shouldSelectItemAt indexPath: IndexPath) -> Bool {
        presentMediaDetailViewController(for: indexPath)
        return false
    }

    func collectionView(willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row == searchListViewModel.itemCount - 1 else { return }
        Task {
            guard let itemIDs = await searchListViewModel.fetchNextPage() else { return }
            await MainActor.run {
                updateSnapshot(itemIDs)
            }
        }
    }

    private func presentMediaDetailViewController(for indexPath: IndexPath) {
        guard let itemID = dataSource?.itemIdentifier(for: indexPath),
              let mediaItem = searchListViewModel.mediaItem(for: itemID) else { return }
        switch mediaItem.mediaType {
        case .movie:
            guard let mediaDetailViewController: MediaDetailViewController<Type> = mediaDetailViewController(
                itemID: itemID, mediaType: .movie
            ) else { return }
            let navigationController = UINavigationController(rootViewController: mediaDetailViewController)
            present(navigationController, animated: true)
        case .tvShow:
            guard let mediaDetailViewController: MediaDetailViewController<Type> = mediaDetailViewController(
                itemID: itemID, mediaType: .tvShow
            ) else { return }
            let navigationController = UINavigationController(rootViewController: mediaDetailViewController)
            present(navigationController, animated: true)
        }
    }

    private func mediaDetailViewController(
        itemID: MediaItem.ID, mediaType: MediaType
    ) -> MediaDetailViewController<Type>? {
        guard let detailViewModel = searchListViewModel.mediaDetailViewModel(for: itemID),
              let similarViewModel = searchListViewModel.similarViewModel(for: itemID) else { return nil }
        return MediaDetailViewController<Type>(
            mediaDetailViewModel: detailViewModel,
            creditsViewModel: CreditsViewModel(),
            similarViewModel: similarViewModel
        )
    }
}

// MARK: - Constants

private enum Constants {
    static let viewBackgroundColor = UIColor.systemBackground
    static let collectionViewBackgroundColor = UIColor.systemGray6
    static let collectionViewContentInsetTop = CGFloat(-25)
    static let emptyPosterImage = UIImage(named: "Empty")
    static let posterImageSize = CGSize(width: 100, height: 150)
}

// MARK: - CollectionViewDelegate

protocol SearchListCollectionViewDelegate: AnyObject {
    func collectionView(shouldSelectItemAt indexPath: IndexPath) -> Bool
    func collectionView(willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
}

final class SearchListViewControllerDelegate: NSObject, UICollectionViewDelegate {
    weak var searchListCollectionViewDelegate: (any SearchListCollectionViewDelegate)?

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return searchListCollectionViewDelegate?.collectionView(shouldSelectItemAt: indexPath) ?? false
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath
    ) {
        searchListCollectionViewDelegate?.collectionView(willDisplay: cell, forItemAt: indexPath)
    }
}
