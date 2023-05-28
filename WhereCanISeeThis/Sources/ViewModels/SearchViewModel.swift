import UIKit

final class SearchViewModel: MediaItemViewModelProtocol {
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private var query: String
    private var moviePages: [Page<Movie>]
    private var tvShowPages: [Page<TVShow>]
    private var movieGenresList: GenreList
    private var tvShowGenresList: GenreList
    private var onError: ((String) -> Void)?
    private var onUpdate: (() -> Void)?

    private var movies: [Movie] {
        return moviePages.flatMap { $0.results }
    }
    private var movieIDs: [Movie.ID] {
        return movies.map { $0.id }
    }
    private var tvShows: [TVShow] {
        return tvShowPages.flatMap { $0.results }
    }
    private var tvShowIDs: [TVShow.ID] {
        return tvShows.map { $0.id }
    }
    private var language: String? {
        return Locale.current.language.languageCode?.identifier
    }
    private var country: String? {
        return Locale.current.language.region?.identifier
    }
    private var languageCode: String? {
        guard let language,
              let country else { return nil }
        return "\(language)-\(country)"
    }

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = .init(),
        query: String,
        moviePages: [Page<Movie>] = [],
        tvShowPages: [Page<TVShow>] = [],
        movieGenresList: GenreList,
        tvShowGenresList: GenreList
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.query = query
        self.moviePages = moviePages
        self.tvShowPages = tvShowPages
        self.movieGenresList = movieGenresList
        self.tvShowGenresList = tvShowGenresList
    }
}

extension SearchViewModel {
    enum Action {
        case searchMovie(query: String)
        case searchTVShow(query: String)
        case fetchNextMoviePage(completion: ([MediaItem.ID]) -> Void)
        case fetchNextTVShowPage(completion: ([MediaItem.ID]) -> Void)
    }

    func action(_ action: Action) {
        switch action {
        case .searchMovie(let query):
            searchMovie(query: query)
        case .searchTVShow(let query):
            searchTVShow(query: query)
        case .fetchNextMoviePage(let completion):
            fetchNextMoviePage(completion: completion)
        case .fetchNextTVShowPage(let completion):
            fetchNextTVShowPage(completion: completion)
        }
    }

    func mediaItem(for id: MediaItem.ID, type: MediaType) -> MediaItem? {
        switch type {
        case .movie:
            return movieItem(for: id)
        case .tvShow:
            return tvShowItem(for: id)
        }
    }

    func mediaItemIDs(of type: MediaType) -> [MediaItem.ID] {
        switch type {
        case .movie:
            return movieIDs
        case .tvShow:
            return tvShowIDs
        }
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

    func itemCount(of type: MediaType) -> Int {
        switch type {
        case .movie:
            return moviePages.first?.totalResults ?? 0
        case .tvShow:
            return tvShowPages.first?.totalResults ?? 0
        }
    }

    func mediaDetailViewModel(for id: MediaItem.ID, type: MediaType) -> MediaDetailViewModel? {
        switch type {
        case .movie:
            return movieDetail(for: id)
        case .tvShow:
            return tvShowDetail(for: id)
        }
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    func bind(onUpdate: @escaping () -> Void) {
        self.onUpdate = onUpdate
    }

    private func movie(for id: Movie.ID) -> Movie? {
        return movies.first(where: { $0.id == id })
    }

    private func tvShow(for id: TVShow.ID) -> TVShow? {
        return tvShows.first(where: { $0.id == id })
    }

    private func movieItem(for id: Movie.ID) -> MediaItem? {
        guard let movie = movie(for: id) else { return nil }
        return MediaItem(media: movie, genreList: movieGenresList)
    }

    private func tvShowItem(for id: TVShow.ID) -> MediaItem? {
        guard let tvShow = tvShow(for: id) else { return nil }
        return MediaItem(media: tvShow, genreList: tvShowGenresList)
    }

    private func searchMovie(query: String) {
        Task {
            do {
                moviePages = try await [movieDatabaseAPIClient.searchMovies(query: query, language: languageCode)]
                await MainActor.run {
                    onUpdate?()
                }
            } catch let error as WhereCanISeeThisError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }

    private func searchTVShow(query: String) {
        Task {
            do {
                tvShowPages = try await [movieDatabaseAPIClient.searchTVShows(query: query, language: languageCode)]
                await MainActor.run {
                    onUpdate?()
                }
            } catch let error as WhereCanISeeThisError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }

    private func fetchNextMoviePage(completion: @escaping ([MediaItem.ID]) -> Void) {
        guard let lastPage = moviePages.last?.page,
              let totalPages = moviePages.first?.totalPages,
              lastPage < totalPages else { return }
        Task {
            do {
                let moviePage = try await movieDatabaseAPIClient.searchMovies(query: query,
                                                                              language: languageCode,
                                                                              page: lastPage + 1)
                moviePages.append(moviePage)
                await MainActor.run {
                    completion(movieIDs)
                }
            } catch let error as WhereCanISeeThisError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }

    private func fetchNextTVShowPage(completion: @escaping ([MediaItem.ID]) -> Void) {
        guard let lastPage = tvShowPages.last?.page,
              let totalPages = tvShowPages.first?.totalPages,
              lastPage < totalPages else { return }
        Task {
            do {
                let tvShowPage = try await movieDatabaseAPIClient.searchTVShows(query: query,
                                                                                language: languageCode,
                                                                                page: lastPage + 1)
                tvShowPages.append(tvShowPage)
                await MainActor.run {
                    completion(tvShowIDs)
                }
            } catch let error as WhereCanISeeThisError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }

    private func movieDetail(for id: Movie.ID) -> MediaDetailViewModel? {
        guard let movieItem = movieItem(for: id),
              let language else { return nil }
        return MediaDetailViewModel(mediaItem: movieItem, country: language, genreList: movieGenresList)
    }

    private func tvShowDetail(for id: TVShow.ID) -> MediaDetailViewModel? {
        guard let tvShowItem = tvShowItem(for: id),
              let language else { return nil }
        return MediaDetailViewModel(mediaItem: tvShowItem, country: language, genreList: tvShowGenresList)
    }
}
