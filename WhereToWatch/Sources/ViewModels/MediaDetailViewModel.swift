import UIKit
import MovieDatabaseAPI

final class MediaDetailViewModel {

    // MARK: Properties

    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private let mediaItem: MediaItem
    private let country: String
    private let genreList: GenreList
    private var watchProviderList: WatchProviderList?
    private var onError: ((String) -> Void)?

    // MARK: Lifecycle

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = MovieDatabaseAPIClient(apiKey: Secrets.apiKey),
        mediaItem: MediaItem,
        country: String,
        genreList: GenreList
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.mediaItem = mediaItem
        self.country = country
        self.genreList = genreList
    }
}

// MARK: - Methods

extension MediaDetailViewModel {
    func mediaItemDetail() -> MediaItem {
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

            guard let watchProviderList = result.results?[country] else { return nil }
            self.watchProviderList = watchProviderList
            return watchProviderList
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
        }
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }
}
