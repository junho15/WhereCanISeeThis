import UIKit
import MovieDatabaseAPI

class SearchViewController: UICollectionViewController {

    // MARK: Properties

    private let searchViewModel: SearchViewModel
    private var dataSource: DataSource?
    private var searchBar: UISearchBar?
    private var tapGestureRecognizer: UIGestureRecognizer?

    // MARK: View Lifecycle

    init(searchViewModel: SearchViewModel = SearchViewModel(), query: String? = nil) {
        self.searchViewModel = searchViewModel

        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        configuration.headerMode = .firstItemInSection
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)

        collectionView.isScrollEnabled = false
        configureSearchBar()
        searchBar?.text = query
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewBackgroundColor

        configureDataSource()
        configureSearchBar()
        searchViewModel.bind { errorMessage in
            print(errorMessage)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        addTapGestureRecognizer()
        guard let query = searchBar?.text else { return }
        updateMediaItems(query)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeTapGestureRecognizer()
    }
}

// MARK: - Methods

extension SearchViewController {
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
            })
    }

    private func configureSearchBar() {
        searchBar = UISearchBar(.media, delegate: self)
        navigationItem.titleView = searchBar
    }

    private func updateMediaItems(_ query: String) {
        Task {
            async let fetchMovieIDs = searchViewModel.searchMovie(query: query)
            async let fetchTVShowIDs = searchViewModel.searchTVShow(query: query)
            let (movieIDs, tvShowIDs) = await (fetchMovieIDs, fetchTVShowIDs)
            guard let movieIDs, let tvShowIDs else { return }
            updateSnapshot([.movie: movieIDs, .tvShow: tvShowIDs])
        }
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
}

// MARK: - DataSource

extension SearchViewController {

    // MARK: Row

    enum Row: Hashable {
        case header(mediaType: MediaType, itemCount: Int)
        case media(mediaType: MediaType, itemIDs: [MediaItem.ID])
    }

    // MARK: typealias

    typealias DataSource = UICollectionViewDiffableDataSource<MediaType, Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MediaType, Row>

    // MARK: CellRegistrationHandler

    private func cellRegistrationHandler(cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row) {
        guard case .media(let mediaType, let itemIDs) = itemIdentifier else { return }
        var contentConfiguration = cell.mediaCollectionContentView(viewModel: searchViewModel)
        contentConfiguration.mediaType = mediaType
        contentConfiguration.itemIDs = itemIDs
        contentConfiguration.viewController = self
        cell.contentConfiguration = contentConfiguration
    }

    private func headerRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: Row) {
        guard case .header(let mediaType, let itemCount) = itemIdentifier else { return }
        var contentConfiguration = cell.defaultContentConfiguration()
        let attributedTitle = AttributedStringMaker.searchListHeader(
            title: mediaType.title, count: itemCount
        ).attributedString
        contentConfiguration.attributedText = attributedTitle
        cell.contentConfiguration = contentConfiguration
    }

    // MARK: Snapshot

    private func updateSnapshot(_ items: [MediaType: [MediaItem.ID]]) {
        var snapShot = Snapshot()
        snapShot.appendSections(MediaType.allCases)
        items.forEach {
            let (mediaType, itemIDs) = ($0.key, $0.value)
            let itemTotalCount = searchViewModel.itemTotalCount(of: mediaType)
            snapShot.appendItems(
                [.header(mediaType: mediaType, itemCount: itemTotalCount),
                 .media(mediaType: mediaType, itemIDs: itemIDs)],
                toSection: mediaType
            )
        }
        dataSource?.apply(snapShot)
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        searchBar.endEditing(true)
        updateMediaItems(query)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.endEditing(true)
    }
}

// MARK: - Constants

extension SearchViewController {
    private enum Constants {
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemGray6
    }
}
