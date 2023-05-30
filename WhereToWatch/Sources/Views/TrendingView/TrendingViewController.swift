import UIKit
import MovieDatabaseAPI

final class TrendingViewController: UICollectionViewController {

    // MARK: Properties

    private let trendingViewModel: TrendingViewModel
    private var dataSource: DataSource?
    private var searchBar: UISearchBar?
    private var tapGestureRecognizer: UIGestureRecognizer?

    // MARK: View Lifecycle

    init(trendingViewModel: TrendingViewModel = TrendingViewModel()) {
        self.trendingViewModel = trendingViewModel

        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        configuration.headerMode = .firstItemInSection
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)

        collectionView.isScrollEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewBackgroundColor

        trendingViewModel.action(.fetchMovieGenresList)
        trendingViewModel.action(.fetchTVShowGenresList)

        configureDataSource()
        configureSearchBar()
        trendingViewModel.bind(onError: { errorMessage in
            print(errorMessage)
        })
        trendingViewModel.bind(onUpdate: { [weak self] in
            guard let self else { return }
            updateSnapshot()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        trendingViewModel.action(.fetchTrendingMovies)
        trendingViewModel.action(.fetchTrendingTVShows)
        addTapGestureRecognizer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeTapGestureRecognizer()
    }
}

// MARK: - Methods

extension TrendingViewController {
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        let headerRegistration = UICollectionView.CellRegistration(handler: headerRegistrationHandler)
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                switch itemIdentifier {
                case .header:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: headerRegistration, for: indexPath, item: itemIdentifier
                    )
                case .media:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: cellRegistration, for: indexPath, item: itemIdentifier
                    )
                }
            }
        )
    }

    private func configureSearchBar() {
        searchBar = UISearchBar(.media, delegate: self)
        navigationItem.titleView = searchBar
    }

    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissSearchBarKeyboard))
        self.tapGestureRecognizer = tapGestureRecognizer
        tapGestureRecognizer.cancelsTouchesInView = false
        collectionView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func removeTapGestureRecognizer() {
        guard let tapGestureRecognizer else { return }
        collectionView.removeGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func dismissSearchBarKeyboard() {
        searchBar?.endEditing(true)
    }

    private func pushSearchViewController(query: String) {
        trendingViewModel.action(.searchViewModel(query: query) { [weak self] searchViewModel in
            guard let self,
                  let searchViewModel else { return }
            let viewController = SearchViewController(searchViewModel: searchViewModel, query: query)
            navigationController?.pushViewController(viewController, animated: true)
        })
    }
}

// MARK: - DataSource

extension TrendingViewController {

    // MARK: Row

    enum Row: Hashable {
        case header(MediaType)
        case media(mediaType: MediaType, itemIDs: [MediaItem.ID])
    }

    // MARK: typealias

    typealias DataSource = UICollectionViewDiffableDataSource<MediaType, Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MediaType, Row>

    // MARK: CellRegistrationHandler

    private func cellRegistrationHandler(cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row) {
        guard case .media(let mediaType, let itemIDs) = itemIdentifier else { return }
        var contentConfiguration = cell.mediaCollectionContentView(viewModel: trendingViewModel)
        contentConfiguration.mediaType = mediaType
        contentConfiguration.itemIDs = itemIDs
        contentConfiguration.viewController = self
        cell.contentConfiguration = contentConfiguration
    }

    private func headerRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: Row) {
        guard case .header(let mediaType) = itemIdentifier else { return }
        var contentConfiguration = cell.defaultContentConfiguration()
        let attributedTitle = AttributedStringMaker.trendingHeader(title: mediaType.trendingTitle).attributedString
        contentConfiguration.attributedText = attributedTitle
        cell.contentConfiguration = contentConfiguration
    }

    // MARK: Snapshot

    private func updateSnapshot() {
        var snapShot = Snapshot()
        snapShot.appendSections(MediaType.allCases)
        MediaType.allCases.forEach { mediaType in
            let itemIDs = trendingViewModel.mediaItemIDs(of: mediaType)
            snapShot.appendItems(
                [.header(mediaType), .media(mediaType: mediaType, itemIDs: itemIDs)], toSection: mediaType
            )
        }
        dataSource?.apply(snapShot)
    }
}

// MARK: - UISearchBarDelegate

extension TrendingViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        searchBar.endEditing(true)
        pushSearchViewController(query: query)
        searchBar.text = nil
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.endEditing(true)
    }
}

// MARK: - Constants

extension TrendingViewController {
    private enum Constants {
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemBackground
    }
}
