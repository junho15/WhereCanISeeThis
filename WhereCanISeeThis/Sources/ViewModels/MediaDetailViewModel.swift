import Foundation

final class MediaDetailViewModel {
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private let media: MediaProtocol
    private let country: String
    private let genreList: GenreList
    private var watchProviderList: WatchProviderList?
    private var onError: ((String) -> Void)?

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = MovieDatabaseAPIClient(),
        media: MediaProtocol,
        country: String,
        genreList: GenreList
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.media = media
        self.country = country
        self.genreList = genreList
    }
}

extension MediaDetailViewModel {
    enum Action {
        case fetchMediaDetail(completion: ((MediaProtocol) -> Void))
        case fetchWatchProviders(completion: ((WatchProviderList) -> Void))
    }

    func action(_ action: Action) {
        switch action {
        case .fetchMediaDetail(let completion):
            completion(media)
        case .fetchWatchProviders(let completion):
            if let watchProviderList {
                completion(watchProviderList)
            } else {
                fetchWatchProviderList(completion: completion)
            }
        }
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    private func fetchWatchProviderList(completion: @escaping (WatchProviderList) -> Void) {
        Task {
            do {
                let result: WatchProviderResult
                switch media.mediaType {
                case .movie:
                    result = try await movieDatabaseAPIClient.fetchMovieWatchProviders(movieID: media.id)
                case .tvShow:
                    result = try await movieDatabaseAPIClient.fetchTVShowWatchProviders(tvShowID: media.id)
                }

                guard let watchProviderList = result.results?[country] else { return }
                self.watchProviderList = watchProviderList
                completion(watchProviderList)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }
}
