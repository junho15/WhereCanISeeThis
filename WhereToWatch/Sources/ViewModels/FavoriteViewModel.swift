import Foundation

final class FavoriteViewModel {

    // MARK: Properties

    private let favoriteService = FavoriteService.shared
    private var query: String
    private var favoriteMediaItems: [FavoriteMediaItem] {
        didSet {
            self.onUpdate?(favoriteMediaItemIDs)
        }
    }
    private var onError: ((String) -> Void)?
    private var onUpdate: (([FavoriteMediaItem.ID]) -> Void)?

    private var favoriteMediaItemIDs: [FavoriteMediaItem.ID] {
        favoriteMediaItems.map { $0.id }
    }

    // MARK: Lifecycle

    init(query: String  = "", favoriteMediaItems: [FavoriteMediaItem] = []) {
        self.query = query
        self.favoriteMediaItems = favoriteMediaItems
    }
}

// MARK: - Methods

extension FavoriteViewModel {
    enum Action {
        case fetchFavoriteMediaItems(sortOption: FavoriteService.SortOption = .registrationDate, query: String? = nil)
        case deleteFavoriteMediaItem(FavoriteMediaItem.ID)
    }

    func action(_ action: Action) {
        switch action {
        case .fetchFavoriteMediaItems(let sortOption, let query):
            fetchFavoriteMediaItems(sortOption: sortOption, query: query)
        case .deleteFavoriteMediaItem(let id):
            deleteFavoriteMediaItem(for: id)
        }
    }

    func favoriteMediaItem(for id: FavoriteMediaItem.ID) -> FavoriteMediaItem? {
        return favoriteMediaItems.first(where: { $0.id == id })
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    func bind(onUpdate: @escaping ([FavoriteMediaItem.ID]) -> Void) {
        self.onUpdate = onUpdate
    }

    private func mediaDetailViewModel(for id: FavoriteMediaItem.ID) -> MediaDetailViewModel? {
        guard let favoriteItem = favoriteMediaItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: favoriteItem)
    }

    private func fetchFavoriteMediaItems(sortOption: FavoriteService.SortOption, query: String?) {
        do {
            favoriteMediaItems = try favoriteService.fetch(sortOption: sortOption, query: query)
        } catch {
            onError?(error.localizedDescription)
        }
    }

    private func deleteFavoriteMediaItem(for id: FavoriteMediaItem.ID) {
        do {
            try favoriteService.delete(id)
            favoriteMediaItems.removeAll(where: { $0.id == id })
        } catch {
            onError?(error.localizedDescription)
        }
    }
}
