import Foundation

final class SearchListViewModel {
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private var movieQuery: String?
    private var moviePages: [Page<Movie>]
    private var tvShowQuery: String?
    private var tvShowPages: [Page<TVShow>]
    private var onError: ((String) -> Void)?

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

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = .init(),
        moviePages: [Page<Movie>] = [],
        tvShowPages: [Page<TVShow>] = []
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.moviePages = moviePages
        self.tvShowPages = tvShowPages
    }
}

extension SearchListViewModel {
    enum Action {
        case searchMovie(query: String, completion: ([Movie.ID]) -> Void)
        case searchTVShow(query: String, completion: ([TVShow.ID]) -> Void)
        case fetchNextMoviePage(completion: ((all: [Movie.ID], updated: [Movie.ID])) -> Void)
        case fetchNextTVShowPage(completion: ((all: [TVShow.ID], updated: [TVShow.ID])) -> Void)
    }

    func action(_ action: Action) {
        switch action {
        case .searchMovie(let query, let completion):
            searchMovie(query: query, completion: completion)
        case .searchTVShow(let query, let completion):
            searchTVShow(query: query, completion: completion)
        case .fetchNextMoviePage(let completion):
            fetchNextMoviePage(completion: completion)
        case .fetchNextTVShowPage(let completion):
            fetchNextTVShowPage(completion: completion)
        }
    }

    func movie(for id: Movie.ID) -> Movie? {
        return movies.first(where: { $0.id == id })
    }

    func tvShow(for id: TVShow.ID) -> TVShow? {
        return tvShows.first(where: { $0.id == id })
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    private func searchMovie(query: String, completion: @escaping ([Movie.ID]) -> Void) {
        Task {
            do {
                moviePages = try await [movieDatabaseAPIClient.searchMovies(query: query)]
                completion(movieIDs)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func searchTVShow(query: String, completion: @escaping ([TVShow.ID]) -> Void) {
        Task {
            do {
                tvShowPages = try await [movieDatabaseAPIClient.searchTVShows(query: query)]
                completion(tvShowIDs)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func fetchNextMoviePage(completion: @escaping ((all: [Movie.ID], updated: [Movie.ID])) -> Void) {
        guard let movieQuery,
              let lastPage = moviePages.last?.page,
              let totalPages = moviePages.last?.totalPages,
              lastPage < totalPages else { return }
        Task {
            do {
                let moviePage = try await movieDatabaseAPIClient.searchMovies(query: movieQuery,
                                                                              page: lastPage + 1)
                moviePages.append(moviePage)
                completion((movieIDs, moviePage.results.map { $0.id }))
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func fetchNextTVShowPage(completion: @escaping ((all: [TVShow.ID], updated: [TVShow.ID])) -> Void) {
        guard let tvShowQuery,
              let lastPage = tvShowPages.last?.page,
              let totalPages = tvShowPages.last?.totalPages,
              lastPage < totalPages else { return }
        Task {
            do {
                let tvShowPage = try await movieDatabaseAPIClient.searchTVShows(query: tvShowQuery,
                                                                                page: lastPage + 1)
                tvShowPages.append(tvShowPage)
                completion((tvShowIDs, tvShowPage.results.map { $0.id }))
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }
}
