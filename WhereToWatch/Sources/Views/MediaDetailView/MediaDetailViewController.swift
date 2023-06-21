import UIKit
import MovieDatabaseAPI

final class MediaDetailViewController<Type: MediaProtocol>: UICollectionViewController {

    // MARK: Properties

    private let mediaDetailViewModel: MediaDetailViewModel
    private let creditsViewModel: CreditsViewModel
    private let similarViewModel: SimilarViewModel<Type>
    private var dataSource: DataSource?
    private var favoriteBarButtonItem: UIBarButtonItem?
    private var onUpdate: ((FavoriteMediaItem.ID?) -> Void)?

    // MARK: View Lifecycle

    init(
        mediaDetailViewModel: MediaDetailViewModel,
        creditsViewModel: CreditsViewModel,
        similarViewModel: SimilarViewModel<Type>
    ) {
        self.mediaDetailViewModel = mediaDetailViewModel
        self.creditsViewModel = creditsViewModel
        self.similarViewModel = similarViewModel

        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        configuration.headerMode = .firstItemInSection
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDataSource()
        configureNavigationItem()
        creditsViewModel.bind(onError: { errorMessage in
            print(errorMessage)
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateSnapshot()
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(
        _ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath
    ) -> Bool {
        return false
    }
}

// MARK: - Methods

extension MediaDetailViewController {
    func bind(onUpdate: @escaping (FavoriteMediaItem.ID?) -> Void) {
        self.onUpdate = onUpdate
    }

    private func configureDataSource() {
        let textCellRegistration = UICollectionView.CellRegistration(handler: textCellRegistrationHandler)
        let posterCellRegistration = UICollectionView.CellRegistration(handler: posterCellRegistrationHandler)
        let imageCellRegistration = UICollectionView.CellRegistration(handler: imageCellRegistrationHandler)
        let watchProviderCollectionCellRegistration = UICollectionView.CellRegistration(
            handler: watchProviderCollectionCellRegistrationHandler
        )
        let creditsCollectionCellRegistration = UICollectionView.CellRegistration(
            handler: creditsCollectionCellRegistrationHandler
        )
        let similarCollectionCellRegistration = UICollectionView.CellRegistration(
            handler: similarCollectionCellRegistrationHandler
        )
        dataSource = DataSource(
            collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
                switch itemIdentifier {
                case .header, .text:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: textCellRegistration, for: indexPath, item: itemIdentifier
                    )
                case .poster:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: posterCellRegistration, for: indexPath, item: itemIdentifier
                    )
                case .watchProviders:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: watchProviderCollectionCellRegistration, for: indexPath, item: itemIdentifier
                    )
                case .image:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: imageCellRegistration, for: indexPath, item: itemIdentifier
                    )
                case .credits:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: creditsCollectionCellRegistration, for: indexPath, item: itemIdentifier
                    )
                case .similar:
                    return collectionView.dequeueConfiguredReusableCell(
                        using: similarCollectionCellRegistration, for: indexPath, item: itemIdentifier)
                }
            }
        )
    }

    private func configureNavigationItem() {
        favoriteBarButtonItem = UIBarButtonItem(image: nil, primaryAction: favoriteBarButtonAction())
        setImageFavoriteBarButton(mediaDetailViewModel.isFavorite())
        navigationItem.leftBarButtonItem = favoriteBarButtonItem

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .close, primaryAction: UIAction(handler: { [weak self] _ in
                guard let self else { return }
                dismiss(animated: true)
            })
        )
    }

    private func favoriteBarButtonAction() -> UIAction {
        return UIAction { [weak self] _ in
            guard let self else { return }
            if mediaDetailViewModel.isFavorite() {
                mediaDetailViewModel.action(.deleteFavoriteMediaItem)
                setImageFavoriteBarButton(false)
                onUpdate?(nil)
            } else {
                mediaDetailViewModel.action(.saveFavoriteMediaItem)
                setImageFavoriteBarButton(true)
                onUpdate?(mediaDetailViewModel.mediaItemDetail().id)
            }
        }
    }

    private func setImageFavoriteBarButton(_ isFavorite: Bool) {
        if isFavorite {
            favoriteBarButtonItem?.image = Constants.favoriteImage
        } else {
            favoriteBarButtonItem?.image = Constants.notFavoriteImage
        }
    }
}

// MARK: - DataSource

extension MediaDetailViewController {

    // MARK: Section, Row

    enum Section: Hashable {
        case poster
        case watchProvider(WatchProviderType)
        case overView
        case justWatch
        case credits
        case similar
    }

    enum Row: Hashable {
        case header(String?)
        case text(String?)
        case poster(poster: UIImage?, backdrop: UIImage?, title: String?, year: String?, genre: String?)
        case watchProviders(type: WatchProviderType, watchProviders: [WatchProvider])
        case image(UIImage?)
        case credits([Credit.ID])
        case similar([MediaItem.ID])
    }

    // MARK: typealias

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>

    // MARK: CellRegistrationHandler

    private func textCellRegistrationHandler(
        cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        var contentConfiguration = cell.defaultContentConfiguration()
        if case .text(let text) = itemIdentifier {
            contentConfiguration.text = text
        } else if case .header(let title) = itemIdentifier,
                  let title {
            contentConfiguration.attributedText = AttributedStringMaker.mediaDetailHeader(title: title).attributedString
        }
        cell.contentConfiguration = contentConfiguration
    }

    private func posterCellRegistrationHandler(
        cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        guard case .poster(
            let posterImage, let backdropImage, let title, let year, let genre
        ) = itemIdentifier else { return }
        var contentConfiguration = cell.posterContentView()
        contentConfiguration.posterImage = posterImage
        contentConfiguration.backdropImage = backdropImage
        contentConfiguration.title = title
        contentConfiguration.year = year
        contentConfiguration.genre = genre
        cell.contentConfiguration = contentConfiguration
    }

    private func imageCellRegistrationHandler(
        cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        guard case .image(let image) = itemIdentifier else { return }
        var contentConfiguration = cell.imageConfiguration()
        contentConfiguration.imageViewContentMode = .right
        contentConfiguration.image = image
        cell.contentConfiguration = contentConfiguration
    }

    private func watchProviderCollectionCellRegistrationHandler(
        cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        guard case .watchProviders(_, let watchProviders) = itemIdentifier else { return }
        var contentConfiguration = cell.watchProviderCollectionConfiguration()
        contentConfiguration.items = []
        cell.contentConfiguration = contentConfiguration
        Task {
            await withTaskGroup(of: (image: UIImage?, title: String?).self) { [weak self] taskGroup in
                guard let self else { return }
                watchProviders.sorted { $0.displayPriority ?? 0 < $1.displayPriority ?? 0 } .forEach { watchProvider in
                    taskGroup.addTask { [weak self] in
                        guard let self,
                              let logoPath = watchProvider.logoPath else {
                            return (image: nil, title: watchProvider.providerName)
                        }
                        let image = await self.mediaDetailViewModel.image(imageSize: .original, imagePath: logoPath)
                        return (image: image, title: watchProvider.providerName)
                    }
                }
                for await result in taskGroup {
                    contentConfiguration.items?.append(result)
                }
            }
            await MainActor.run {
                cell.contentConfiguration = contentConfiguration
            }
        }
    }

    private func creditsCollectionCellRegistrationHandler(
        cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        guard case .credits(let creditIDs) = itemIdentifier else { return }
        var contentConfiguration = cell.creditsCollectionConfiguration()
        contentConfiguration.viewModel = creditsViewModel
        contentConfiguration.creditIDs = creditIDs
        cell.contentConfiguration = contentConfiguration
    }

    private func similarCollectionCellRegistrationHandler(
        cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        guard case .similar(let mediaItemIDs) = itemIdentifier else { return }
        if let similarViewModel = similarViewModel as? SimilarViewModel<Movie> {
            var contentConfiguration = cell.similarMoviesCollectionConfiguration()
            contentConfiguration.itemIDs = mediaItemIDs
            contentConfiguration.viewModel = similarViewModel
            cell.contentConfiguration = contentConfiguration
        } else if let similarViewModel = similarViewModel as? SimilarViewModel<TVShow> {
            var contentConfiguration = cell.similarTVShowsCollectionConfiguration()
            contentConfiguration.itemIDs = mediaItemIDs
            contentConfiguration.viewModel = similarViewModel
            cell.contentConfiguration = contentConfiguration
        }
    }

    private struct MediaInfo {
        let mediaItem: any MediaItemProtocol
        let posterImage: UIImage?
        let backdropImage: UIImage?
        let watchProviderList: WatchProviderList?
        let creditIDs: [Credit.ID]
        let similarIDs: [MediaItem.ID]
    }

    private func mediaInfo() async -> MediaInfo {
        let mediaItem = mediaDetailViewModel.mediaItemDetail()

        async let fetchPosterImage = mediaDetailViewModel.image(
            imageSize: .w500, imagePath: mediaItem.posterPath
        ) ?? Constants.emptyPosterImage
        async let fetchBackdropImage = mediaDetailViewModel.image(
            imageSize: .w500, imagePath: mediaItem.backdropPath
        )
        async let fetchWatchProviderList = mediaDetailViewModel.fetchWatchProviderList()
        async let fetchCreditIDs = {
            switch mediaItem.mediaType {
            case .movie:
                return await creditsViewModel.fetchMovieCredits(movieID: mediaItem.id)
            case .tvShow:
                return await creditsViewModel.fetchTVShowCredits(tvShowID: mediaItem.id)
            }
        }()
        async let similarIDs = similarViewModel.fetchSimilarMedia()

        return await MediaInfo(
            mediaItem: mediaItem,
            posterImage: fetchPosterImage,
            backdropImage: fetchBackdropImage,
            watchProviderList: fetchWatchProviderList,
            creditIDs: fetchCreditIDs,
            similarIDs: similarIDs
        )
    }

    // MARK: Snapshot

    private func updateSnapshot() {
        Task {
            let mediaInfo = await mediaInfo()

            var snapShot = Snapshot()
            snapShot.appendSections([.poster])
            snapShot.appendItems([.poster(
                poster: mediaInfo.posterImage,
                backdrop: mediaInfo.backdropImage,
                title: mediaInfo.mediaItem.title,
                year: mediaInfo.mediaItem.date,
                genre: mediaInfo.mediaItem.genre
            )], toSection: .poster)

            if let watchProviderList = mediaInfo.watchProviderList {
                WatchProviderType.allCases.forEach { type in
                    if let result = watchProviderList.results[type] {
                        snapShot.appendSections([.watchProvider(type)])
                        snapShot.appendItems([.header(type.title)], toSection: .watchProvider(type))
                        snapShot.appendItems(
                            [.watchProviders(type: type, watchProviders: result)], toSection: .watchProvider(type)
                        )
                    }
                }
                snapShot.appendSections([.justWatch])
                snapShot.appendItems(
                    [.image(Constants.justWatchLogoImage?.resized(targetSize: Constants.justWatchLogoSize))],
                    toSection: .justWatch
                )
            }

            snapShot.appendSections([.overView])
            snapShot.appendItems(
                [.header(Constants.overViewHeader), .text(mediaInfo.mediaItem.overView)],
                toSection: .overView
            )

            if mediaInfo.creditIDs.isEmpty == false {
                snapShot.appendSections([.credits])
                snapShot.appendItems(
                    [.header(Constants.creditsHeader), .credits(mediaInfo.creditIDs)],
                    toSection: .credits
                )
            }

            if mediaInfo.similarIDs.isEmpty == false {
                snapShot.appendSections([.similar])
                snapShot.appendItems(
                    [.header(Constants.similarHeader), .similar(mediaInfo.similarIDs)],
                    toSection: .similar
                )
            }

            await MainActor.run {
                dataSource?.apply(snapShot)
            }
        }
    }
}

// MARK: - Constants

private enum Constants {
    static let collectionViewBackgroundColor = UIColor.systemGray6
    static let favoriteImage = UIImage(systemName: "star.fill")
    static let notFavoriteImage = UIImage(systemName: "star")
    static let emptyPosterImage = UIImage(named: "Empty")
    static let emptyLogoImage = UIImage(named: "Empty")
    static let justWatchLogoImage = UIImage(named: "JustWatch")
    static let genreHeader = NSLocalizedString("GENRE_HEADER", comment: "Genre Header")
    static let overViewHeader = NSLocalizedString("OVERVIEW_HEADER", comment: "Overview Header")
    static let creditsHeader = NSLocalizedString("CREDITS_HEADER", comment: "Credits Header")
    static let similarHeader = NSLocalizedString("SIMILAR_HEADER", comment: "Similar Header")
    static let watchProviderLogoSize = CGSize(width: 40, height: 40)
    static let justWatchLogoSize = CGSize(width: 100, height: 100)
}
