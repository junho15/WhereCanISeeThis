import UIKit

final class TrendingViewController: UICollectionViewController {
    private let trendingViewModel: TrendingViewModel
    private var dataSource: DataSource?

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

        configureDataSource()
        configureSearchBar()
        trendingViewModel.bind(onError: { errorMessage in
            print(errorMessage)
        })
        trendingViewModel.bind(onUpdate: { [weak self] mediaType in

                guard let self else { return }
                updateSnapshot([mediaType])
        })

        trendingViewModel.action(.fetchMovieGenresList)
        trendingViewModel.action(.fetchTVShowGenresList)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        trendingViewModel.action(.fetchTrendingMovies)
        trendingViewModel.action(.fetchTrendingTVShows)
    }

    func configureDataSource() {
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
}

extension TrendingViewController {
    enum Row: Hashable {
        case header(MediaType)
        case media(MediaType)
    }

    typealias DataSource = UICollectionViewDiffableDataSource<MediaType, Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MediaType, Row>

    func cellRegistrationHandler(cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row) {
        guard case .media(let mediaType) = itemIdentifier else { return }
        var contentConfiguration = cell.mediaCollectionContentView(viewModel: trendingViewModel)
        contentConfiguration.mediaType = mediaType
        contentConfiguration.itemIDs = trendingViewModel.mediaItemIDs(type: mediaType)
        cell.contentConfiguration = contentConfiguration
    }

    func headerRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: Row) {
        guard case .header(let mediaType) = itemIdentifier else { return }
        var contentConfiguration = cell.defaultContentConfiguration()
        let attributedTitle = NSAttributedString(
            string: mediaType.trendingTitle, attributes: [.font: UIFont.preferredFont(forTextStyle: .headline)]
        )
        contentConfiguration.attributedText = attributedTitle
        cell.contentConfiguration = contentConfiguration
    }

    private func updateSnapshot(_ reloadSections: [MediaType] = []) {
        var snapShot = Snapshot()
        snapShot.appendSections(MediaType.allCases)
        MediaType.allCases.forEach { mediaType in
            snapShot.appendItems([.header(mediaType), .media(mediaType)], toSection: mediaType)
        }
        snapShot.reloadSections(reloadSections)
        dataSource?.apply(snapShot)
    }
}

extension TrendingViewController {
    private enum Constants {
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemBackground
    }
}
