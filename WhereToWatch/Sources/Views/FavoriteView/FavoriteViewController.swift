import UIKit

final class FavoriteViewController: UICollectionViewController {

    // MARK: Properties

    private let favoriteViewModel: FavoriteViewModel
    private var dataSource: DataSource?
    private var searchBar: UISearchBar?
    private var tapGestureRecognizer: UIGestureRecognizer?

    // MARK: View Lifecycle

    init(favoriteViewModel: FavoriteViewModel = FavoriteViewModel()) {
        self.favoriteViewModel = favoriteViewModel

        super.init(collectionViewLayout: UICollectionViewLayout())
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        configuration.showsSeparators = false
        configuration.trailingSwipeActionsConfigurationProvider = deleteSwipeAction(for:)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        collectionView.collectionViewLayout = layout
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewBackgroundColor

        configureDataSource()
        configureNavigationItem()
        favoriteViewModel.bind(onError: { errorMessage in
            print(errorMessage)
        })
        favoriteViewModel.bind(onUpdate: { [weak self] itemIDs in
            guard let self else { return }
            updateSnapshot(itemIDs)
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        favoriteViewModel.action(.fetchFavoriteMediaItems())
        addTapGestureRecognizer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeTapGestureRecognizer()
    }
}

// MARK: - Methods

extension FavoriteViewController {
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
        searchBar = UISearchBar(.media, delegate: self)
        navigationItem.titleView = searchBar

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: Constants.sortOptionButtonImage,
            menu: sortOptionMenu()
        )
    }

    private func sortOptionMenu() -> UIMenu {
        let children = FavoriteService.SortOption.allCases.map { sortOption in
            UIAction(title: sortOption.description) { [weak self] _ in
                guard let self else { return }
                sortOptionMenuAction(sortOption)
            }
        }
        return UIMenu(title: Constants.sortOptionMenuTitle, options: .displayInline, children: children)
    }

    private func sortOptionMenuAction(_ sortOption: FavoriteService.SortOption) {
        favoriteViewModel.action(.fetchFavoriteMediaItems(sortOption: sortOption, query: searchBar?.text ?? nil))
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

    private func deleteSwipeAction(for indexPath: IndexPath?) -> UISwipeActionsConfiguration? {
        guard let indexPath,
              let itemIdentifier = dataSource?.itemIdentifier(for: indexPath) else { return nil }
        let title = Constants.deleteActionTitle
        let deleteAction = UIContextualAction(style: .destructive, title: title) { [weak self] _, _, completion in
            guard let self else { return }
            deleteFavoriteMediaItem(for: itemIdentifier)
            completion(false)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    private func deleteFavoriteMediaItem(for id: FavoriteMediaItem.ID) {
        favoriteViewModel.action(.deleteFavoriteMediaItem(id))
    }
}

// MARK: - DataSource

extension FavoriteViewController {

    // MARK: Section

    enum Section {
        case main
    }

    // MARK: typealias

    typealias DataSource = UICollectionViewDiffableDataSource<Section, FavoriteMediaItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, FavoriteMediaItem.ID>

    // MARK: CellRegistrationHandler
    private func cellRegistrationHandler(
        cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: FavoriteMediaItem.ID
    ) {
        guard let favoriteMediaItem = favoriteViewModel.favoriteMediaItem(for: itemIdentifier) else { return }

        var contentConfiguration = cell.mediaContentView()
        contentConfiguration.title = favoriteMediaItem.title
        contentConfiguration.date = favoriteMediaItem.date
        contentConfiguration.genre = favoriteMediaItem.genre
        contentConfiguration.image = Constants.emptyPosterImage?.resized(targetSize: Constants.posterImageSize)
        cell.contentConfiguration = contentConfiguration

        guard let posterPath = favoriteMediaItem.posterPath else { return }
        Task {
            let image = await favoriteViewModel.image(imageSize: .w500, imagePath: posterPath)
            if indexPath == collectionView.indexPath(for: cell) {
                contentConfiguration.image = image?.resized(targetSize: Constants.posterImageSize)
                await MainActor.run {
                    cell.contentConfiguration = contentConfiguration
                }
            }
        }
    }

    private func updateSnapshot(_ itemIDs: [FavoriteMediaItem.ID]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(itemIDs)
        dataSource?.apply(snapshot)
    }
}

// MARK: - UISearchBarDelegate

extension FavoriteViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        favoriteViewModel.action(.fetchFavoriteMediaItems(query: query))

        searchBar.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        favoriteViewModel.action(.fetchFavoriteMediaItems())

        searchBar.text = nil
        searchBar.endEditing(true)
    }
}

// MARK: - UICollectionViewDelegate

extension FavoriteViewController {
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let itemID = dataSource?.itemIdentifier(for: indexPath),
              let mediaItem = favoriteViewModel.favoriteMediaItem(for: itemID) else {
            return false
        }
        let mediaDetailViewController = MediaDetailViewController(
            mediaDetailViewModel: MediaDetailViewModel(mediaItem: mediaItem)
        )
        let navigationController = UINavigationController(rootViewController: mediaDetailViewController)
        present(navigationController, animated: true)
        return false
    }
}

// MARK: - Constants
extension FavoriteViewController {
    enum Constants {
        static let sortOptionMenuTitle = NSLocalizedString("SORT_OPTION_MENU_TITLE", comment: "Sort Option Menu Title")
        static let deleteActionTitle = NSLocalizedString("DELETE_ACTION_TITLE", comment: "Delete Action Title")
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemGray6
        static let emptyPosterImage = UIImage(named: "Empty")
        static let sortOptionButtonImage = UIImage(systemName: "list.number")
        static let posterImageSize = CGSize(width: 100, height: 150)
    }
}
