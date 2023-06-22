import UIKit
import MovieDatabaseAPI

final class TrendingViewController: UICollectionViewController {

    // MARK: Properties

    private let trendingViewModel: TrendingViewModel
    private var dataSource: DataSource?
    private var tapGestureRecognizer: UIGestureRecognizer?

    // MARK: View Lifecycle

    init(trendingViewModel: TrendingViewModel = TrendingViewModel()) {
        self.trendingViewModel = trendingViewModel

        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
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

        configureDataSource()
        configureSegmentedControl()
        trendingViewModel.bind(onError: { errorMessage in
            print(errorMessage)
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateMediaItems(.day)
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

    private func configureSegmentedControl() {
        let actions = MovieDatabaseURL.TimeWindow.allCases.map { timeWindow in
            UIAction(title: timeWindow.description) { [weak self] _ in
                guard let self else { return }
                updateMediaItems(timeWindow)
            }
        }
        let segmentedControl = UISegmentedControl(frame: .zero, actions: actions)
        segmentedControl.selectedSegmentIndex = 0
        navigationItem.titleView = segmentedControl
    }

    private func updateMediaItems(_ timeWindow: MovieDatabaseURL.TimeWindow) {
        Task {
            async let fetchMovieIDs = trendingViewModel.fetchTrendingMovies(of: timeWindow)
            async let fetchTVShowIDs = trendingViewModel.fetchTrendingTVShows(of: timeWindow)

            let (movieIDs, tVShowIDs) = await (fetchMovieIDs, fetchTVShowIDs)
            guard let movieIDs, let tVShowIDs else { return }
            updateSnapshot([.movie: movieIDs, .tvShow: tVShowIDs])
        }
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

    private func updateSnapshot(_ items: [MediaType: [MediaItem.ID]]) {
        var snapShot = Snapshot()
        snapShot.appendSections(MediaType.allCases)
        items.forEach {
            let (mediaType, itemIDs) = ($0.key, $0.value)
            snapShot.appendItems(
                [.header(mediaType), .media(mediaType: mediaType, itemIDs: itemIDs)], toSection: mediaType
            )
        }
        dataSource?.apply(snapShot)
    }
}

// MARK: - Constants

extension TrendingViewController {
    private enum Constants {
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemGray6
    }
}
