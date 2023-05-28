import UIKit

final class MediaDetailViewModel {
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private let mediaItem: MediaItem
    private let country: String
    private let genreList: GenreList
    private var watchProviderList: WatchProviderList?
    private var onError: ((String) -> Void)?

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = MovieDatabaseAPIClient(),
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

extension MediaDetailViewModel {
    enum Action {
        case fetchWatchProviders(completion: (WatchProviderList) -> Void)
    }

    func action(_ action: Action) {
        switch action {
        case .fetchWatchProviders(let completion):
            fetchWatchProviderList(completion: completion)
        }
    }

    func mediaItemDetail() -> MediaItem {
        return mediaItem
    }

    func watchProviderListDetail() -> WatchProviderList? {
        return watchProviderList
    }

    func image(imageSize: MovieDatabaseURL.ImageSize, imagePath: String) async -> UIImage? {
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

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    private func fetchWatchProviderList(completion: @escaping (WatchProviderList) -> Void) {
        Task {
            do {
                let result: WatchProviderResult
                switch mediaItem.mediaType {
                case .movie:
                    result = try await movieDatabaseAPIClient.fetchMovieWatchProviders(movieID: mediaItem.id)
                case .tvShow:
                    result = try await movieDatabaseAPIClient.fetchTVShowWatchProviders(tvShowID: mediaItem.id)
                }

                guard let watchProviderList = result.results?[country] else { return }
                self.watchProviderList = watchProviderList
                await MainActor.run {
                    completion(watchProviderList)
                }
            } catch let error as WhereCanISeeThisError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }
}
