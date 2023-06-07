import UIKit
import MovieDatabaseAPI

final class MediaDetailViewController: UICollectionViewController {

    // MARK: Properties

    private let mediaDetailViewModel: MediaDetailViewModel
    private var dataSource: DataSource?
    private var favoriteBarButtonItem: UIBarButtonItem?

    // MARK: View Lifecycle

    init(mediaDetailViewModel: MediaDetailViewModel) {
        self.mediaDetailViewModel = mediaDetailViewModel

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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateSnapshot()
    }
}

// MARK: - Methods

extension MediaDetailViewController {
    private func configureDataSource() {
        let textCellRegistration = UICollectionView.CellRegistration(handler: textCellRegistrationHandler)
        let posterCellRegistration = UICollectionView.CellRegistration(handler: posterCellRegistrationHandler)
        let imageCellRegistration = UICollectionView.CellRegistration(handler: imageCellRegistrationHandler)
        let watchProviderCollectionCellRegistration = UICollectionView.CellRegistration(
            handler: watchProviderCollectionCellRegistrationHandler
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
            } else {
                mediaDetailViewModel.action(.saveFavoriteMediaItem)
                setImageFavoriteBarButton(true)
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
    }

    enum Row: Hashable {
        case header(String?)
        case text(String?)
        case poster(poster: UIImage?, backdrop: UIImage?, title: String?, year: String?, genre: String?)
        case watchProviders(type: WatchProviderType, watchProviders: [WatchProvider])
        case image(UIImage?)
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
        guard case.watchProviders(_, let watchProviders) = itemIdentifier else { return }
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

    // MARK: Snapshot

    private func updateSnapshot() {
        Task {
            let mediaItem = mediaDetailViewModel.mediaItemDetail()
            var snapShot = Snapshot()

            async let fetchPosterImage = mediaDetailViewModel.image(
                imageSize: .w500, imagePath: mediaItem.posterPath
            ) ?? Constants.emptyPosterImage
            async let fetchBackdropImage = mediaDetailViewModel.image(
                imageSize: .w500, imagePath: mediaItem.backdropPath
            )
            async let fetchWatchProviderList = mediaDetailViewModel.fetchWatchProviderList()
            let (posterImage, backdropImage, watchProviderList) = await (
                fetchPosterImage, fetchBackdropImage, fetchWatchProviderList
            )

            snapShot.appendSections([.poster])
            snapShot.appendItems([.poster(
                poster: posterImage,
                backdrop: backdropImage,
                title: mediaItem.title,
                year: mediaItem.date,
                genre: mediaItem.genre
            )], toSection: .poster)

            if let watchProviderList {
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
            snapShot.appendItems([.header(Constants.overViewHeader), .text(mediaItem.overView)], toSection: .overView)
            await MainActor.run {
                dataSource?.apply(snapShot)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MediaDetailViewController {
    override func collectionView(
        _ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath
    ) -> Bool {
        return false
    }
}

// MARK: - Constants

extension MediaDetailViewController {
    private enum Constants {
        static let collectionViewBackgroundColor = UIColor.systemGray6
        static let favoriteImage = UIImage(systemName: "star.fill")
        static let notFavoriteImage = UIImage(systemName: "star")
        static let emptyPosterImage = UIImage(named: "Empty")
        static let emptyLogoImage = UIImage(named: "Empty")
        static let justWatchLogoImage = UIImage(named: "JustWatch")
        static let genreHeader = NSLocalizedString("GENRE_HEADER", comment: "Genre Header")
        static let overViewHeader = NSLocalizedString("OVERVIEW_HEADER", comment: "Overview Header")
        static let watchProviderLogoSize = CGSize(width: 40, height: 40)
        static let justWatchLogoSize = CGSize(width: 100, height: 100)
    }
}
