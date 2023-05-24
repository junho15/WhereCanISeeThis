import Foundation

final class TrendingViewModel {
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private var moviePage: Page<Movie>?
    private var tvShowPage: Page<TVShow>?
    private var movieGenresList: GenreList?
    private var tvShowGenresList: GenreList?
    private var onError: ((String) -> Void)?

    private var movies: [Movie] {
        return moviePage?.results ?? []
    }
    private var movieIDs: [Movie.ID] {
        return movies.map { $0.id }
    }
    private var tvShows: [TVShow] {
        return tvShowPage?.results ?? []
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

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = MovieDatabaseAPIClient(),
        moviePage: Page<Movie>? = nil,
        tvShowPage: Page<TVShow>? = nil,
        movieGenresList: GenreList? = nil,
        tvShowGenresList: GenreList? = nil,
        onError: ((String) -> Void)? = nil
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.moviePage = moviePage
        self.tvShowPage = tvShowPage
        self.movieGenresList = movieGenresList
        self.tvShowGenresList = tvShowGenresList
        self.onError = onError
    }
}

extension TrendingViewModel {
    enum Action {
        case fetchMovieGenresList
        case fetchTVShowGenresList
        case fetchTrendingMovies(completion: ([Movie.ID]) -> Void)
        case fetchTrendingTVShows(completion: ([TVShow.ID]) -> Void)
        case searchListViewModel(query: String, completion: (SearchListViewModel?) -> Void)
        case movieDetail(id: Movie.ID, completion: (MediaDetailViewModel?) -> Void)
        case tvShowDetail(id: TVShow.ID, completion: (MediaDetailViewModel?) -> Void)
    }

    func action(_ action: Action) {
        switch action {
        case .fetchMovieGenresList:
            fetchMovieGenresList()
        case .fetchTVShowGenresList:
            fetchTVShowGenresList()
        case .fetchTrendingMovies(let completion):
            fetchTrendingMovies(completion: completion)
        case .fetchTrendingTVShows(let completion):
            fetchTrendingTVShows(completion: completion)
        case .searchListViewModel(let query, let completion):
            completion(searchListViewModel(query: query))
        case .movieDetail(let id, let completion):
            completion(movieDetail(for: id))
        case .tvShowDetail(let id, let completion):
            completion(tvShowDetail(for: id))
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

    private func fetchMovieGenresList() {
        Task {
            do {
                guard let language else { return }
                self.movieGenresList = try await movieDatabaseAPIClient.fetchMovieGenresList(language: language)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func fetchTVShowGenresList() {
        Task {
            do {
                guard let language else { return }
                self.tvShowGenresList = try await movieDatabaseAPIClient.fetchTVShowGenresList(language: language)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func fetchTrendingMovies(completion: @escaping ([Movie.ID]) -> Void) {
        Task {
            do {
                guard let language,
                      let country else { return }
                let languageCode = "\(language)-\(country)"
                self.moviePage = try await movieDatabaseAPIClient.fetchTrendingMovies(
                    timeWindow: Constants.trendingTimeWindow,
                    language: languageCode
                )
                completion(movieIDs)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func fetchTrendingTVShows(completion: @escaping ([TVShow.ID]) -> Void) {
        Task {
            do {
                guard let language,
                      let country else { return }
                let languageCode = "\(language)-\(country)"
                self.tvShowPage = try await movieDatabaseAPIClient.fetchTrendingTVShows(
                    timeWindow: Constants.trendingTimeWindow,
                    language: languageCode
                )
                completion(tvShowIDs)
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func searchListViewModel(query: String) -> SearchListViewModel? {
        guard let movieGenresList,
              let tvShowGenresList else { return nil }
        return SearchListViewModel(query: query, movieGenresList: movieGenresList, tvShowGenresList: tvShowGenresList)
    }

    private func movieDetail(for id: Movie.ID) -> MediaDetailViewModel? {
        guard let movieGenresList,
              let movie = movie(for: id),
              let language else { return nil }
        return MediaDetailViewModel(media: movie, country: language, genreList: movieGenresList)
    }

    private func tvShowDetail(for id: TVShow.ID) -> MediaDetailViewModel? {
        guard let tvShowGenresList,
              let tvShow = tvShow(for: id),
              let language else { return nil }
        return MediaDetailViewModel(media: tvShow, country: language, genreList: tvShowGenresList)
    }
}

extension TrendingViewModel {
    private enum Constants {
        static let trendingTimeWindow = MovieDatabaseURL.TimeWindow.day
    }
}
