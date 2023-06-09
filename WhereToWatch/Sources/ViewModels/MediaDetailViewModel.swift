import UIKit
import MovieDatabaseAPI

final class MediaDetailViewModel {

    // MARK: Properties

    private let favoriteService = FavoriteService.shared
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private let mediaItem: any MediaItemProtocol
    private var watchProviderList: WatchProviderList?
    private var onError: ((String) -> Void)?
    private var onDeleteFavoriteMediaItem: ((FavoriteMediaItem.ID) -> Void)?

    private var country: String? {
        return Locale.current.language.region?.identifier
    }

    // MARK: Lifecycle

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = MovieDatabaseAPIClient(apiKey: Secrets.apiKey),
        mediaItem: any MediaItemProtocol
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.mediaItem = mediaItem
    }
}

// MARK: - Methods

extension MediaDetailViewModel {
    enum Action {
        case saveFavoriteMediaItem
        case deleteFavoriteMediaItem
    }

    func action(_ action: Action) {
        switch action {
        case .saveFavoriteMediaItem:
            saveFavoriteMediaItem()
        case .deleteFavoriteMediaItem:
            deleteFavoriteMediaItem()
        }
    }

    func mediaItemDetail() -> any MediaItemProtocol {
        return mediaItem
    }

    func watchProviderListDetail() -> WatchProviderList? {
        return watchProviderList
    }

    func image(imageSize: MovieDatabaseURL.ImageSize, imagePath: String?) async -> UIImage? {
        guard let imagePath else { return nil }
        do {
            let image = try await movieDatabaseAPIClient.fetchImage(imageSize: imageSize, imagePath: imagePath)
            return image
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
        }
    }

    func fetchWatchProviderList() async -> WatchProviderList? {
        do {
            let result: WatchProviderResult
            switch mediaItem.mediaType {
            case .movie:
                result = try await movieDatabaseAPIClient.fetchMovieWatchProviders(movieID: mediaItem.id)
            case .tvShow:
                result = try await movieDatabaseAPIClient.fetchTVShowWatchProviders(tvShowID: mediaItem.id)
            }

            guard let country,
                  let watchProviderList = result.results?[country] else { return nil }
            self.watchProviderList = watchProviderList
            return watchProviderList
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
        }
    }

    func isFavorite() -> Bool {
        do {
            return try favoriteService.contains(mediaItem.id)
        } catch {
            onError?(error.localizedDescription)
            return false
        }
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    func bind(onDeleteFavoriteMediaItem: @escaping (FavoriteMediaItem.ID) -> Void) {
        self.onDeleteFavoriteMediaItem = onDeleteFavoriteMediaItem
    }

    private func saveFavoriteMediaItem() {
        do {
            guard isFavorite() == false else { return }
            let favoriteMediaItem = FavoriteMediaItem(mediaItem: mediaItem)
            try favoriteService.save(favoriteMediaItem)
        } catch {
            onError?(error.localizedDescription)
        }
    }

    private func deleteFavoriteMediaItem() {
        do {
            try favoriteService.delete(mediaItem.id)
            onDeleteFavoriteMediaItem?(mediaItem.id)
        } catch {
            onError?(error.localizedDescription)
        }
    }
}
