import UIKit

final class SearchListViewModel: MediaItemViewModelProtocol {
    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private var query: String
    private var moviePages: [Page<Movie>]
    private var tvShowPages: [Page<TVShow>]
    private var movieGenresList: GenreList
    private var tvShowGenresList: GenreList
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
    private var language: String? {
        return Locale.current.language.languageCode?.identifier
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

extension SearchListViewModel {
    enum Action {
        case searchMovie(query: String, completion: ([Movie.ID]) -> Void)
        case searchTVShow(query: String, completion: ([TVShow.ID]) -> Void)
        case fetchNextMoviePage(completion: ((all: [Movie.ID], updated: [Movie.ID])) -> Void)
        case fetchNextTVShowPage(completion: ((all: [TVShow.ID], updated: [TVShow.ID])) -> Void)
        case movieDetail(id: Movie.ID, completion: (MediaDetailViewModel?) -> Void)
        case tvShowDetail(id: TVShow.ID, completion: (MediaDetailViewModel?) -> Void)
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
        case .movieDetail(let id, let completion):
            completion(movieDetail(for: id))
        case .tvShowDetail(let id, let completion):
            completion(tvShowDetail(for: id))
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

    func image(imageSize: MovieDatabaseURL.ImageSize, imagePath: String) async -> UIImage? {
        do {
            let image = try await movieDatabaseAPIClient.fetchImage(imageSize: imageSize, imagePath: imagePath)
            return image
        } catch {
            onError?(error.localizedDescription)
            return nil
        }
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
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
        guard let lastPage = moviePages.last?.page,
              let totalPages = moviePages.last?.totalPages,
              lastPage < totalPages else { return }
        Task {
            do {
                let moviePage = try await movieDatabaseAPIClient.searchMovies(query: query,
                                                                              page: lastPage + 1)
                moviePages.append(moviePage)
                completion((movieIDs, moviePage.results.map { $0.id }))
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
            }
        }
    }

    private func fetchNextTVShowPage(completion: @escaping ((all: [TVShow.ID], updated: [TVShow.ID])) -> Void) {
        guard let lastPage = tvShowPages.last?.page,
              let totalPages = tvShowPages.last?.totalPages,
              lastPage < totalPages else { return }
        Task {
            do {
                let tvShowPage = try await movieDatabaseAPIClient.searchTVShows(query: query,
                                                                                page: lastPage + 1)
                tvShowPages.append(tvShowPage)
                completion((tvShowIDs, tvShowPage.results.map { $0.id }))
            } catch let error as WhereCanISeeThisError {
                onError?(error.localizedDescription)
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
