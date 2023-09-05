import UIKit
import MovieDatabaseAPI

final class SearchViewModel: MediaItemViewModelProtocol {

    // MARK: Properties

    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private var query: String
    private var moviePages: [Page<Movie>]
    private var tvShowPages: [Page<TVShow>]
    private var movieGenresList: GenreList?
    private var tvShowGenresList: GenreList?
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
    private var country: String? {
        return Locale.current.language.region?.identifier
    }
    private var languageCode: String? {
        guard let language,
              let country else { return nil }
        return "\(language)-\(country)"
    }

    // MARK: Lifecycle

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = .init(apiKey: Secrets.apiKey),
        query: String = "",
        moviePages: [Page<Movie>] = [],
        tvShowPages: [Page<TVShow>] = [],
        movieGenresList: GenreList? = nil,
        tvShowGenresList: GenreList? = nil
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.query = query
        self.moviePages = moviePages
        self.tvShowPages = tvShowPages
        self.movieGenresList = movieGenresList
        self.tvShowGenresList = tvShowGenresList
    }
}

// MARK: - Methods

extension SearchViewModel {
    func searchMovie(query: String) async -> [MediaItem.ID]? {
        do {
            if movieGenresList == nil,
               let language {
                self.movieGenresList = try await movieDatabaseAPIClient.fetchMovieGenresList(language: language)
            }

            self.moviePages = try await [movieDatabaseAPIClient.searchMovies(query: query, language: languageCode)]
            self.query = query
            return movieIDs
        } catch let error {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
        }
    }

    func searchTVShow(query: String) async -> [MediaItem.ID]? {
        do {
            if tvShowGenresList == nil,
               let language {
                self.tvShowGenresList = try await movieDatabaseAPIClient.fetchTVShowGenresList(language: language)
            }

            self.tvShowPages = try await [movieDatabaseAPIClient.searchTVShows(query: query, language: languageCode)]
            self.query = query
            return tvShowIDs
        } catch let error {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
        }
    }

    func fetchNextMoviePage() async -> [MediaItem.ID]? {
        guard let lastPage = moviePages.last?.page,
              let totalPages = moviePages.first?.totalPages,
              lastPage < totalPages else { return movieIDs }
        do {
            let moviePage = try await movieDatabaseAPIClient.searchMovies(
                query: query,
                language: languageCode,
                page: lastPage + 1
            )
            moviePages.append(moviePage)
            return movieIDs
        } catch let error {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return tvShowIDs
        }
    }

    func fetchNextTVShowPage() async -> [MediaItem.ID]? {
        guard let lastPage = tvShowPages.last?.page,
              let totalPages = tvShowPages.first?.totalPages,
              lastPage < totalPages else { return tvShowIDs }
        do {
            let tvShowPage = try await movieDatabaseAPIClient.searchTVShows(
                query: query,
                language: languageCode,
                page: lastPage + 1
            )
            tvShowPages.append(tvShowPage)
            return tvShowIDs
        } catch let error {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return tvShowIDs
        }
    }

    func mediaItem(for id: MediaItem.ID, type: MediaType?) -> MediaItem? {
        guard let type else { return nil }
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

    func itemTotalCount(of type: MediaType) -> Int {
        switch type {
        case .movie:
            return moviePages.first?.totalResults ?? 0
        case .tvShow:
            return tvShowPages.first?.totalResults ?? 0
        }
    }

    func mediaDetailViewModel(for id: MediaItem.ID, type: MediaType?) -> MediaDetailViewModel? {
        guard let type else { return nil }
        switch type {
        case .movie:
            return movieDetail(for: id)
        case .tvShow:
            return tvShowDetail(for: id)
        }
    }

    func similarViewModel<T: MediaProtocol>(
        for id: MediaItem.ID, type: MovieDatabaseAPI.MediaType?
    ) -> SimilarViewModel<T>? {
        guard let type, let mediaItem = mediaItem(for: id, type: type) else { return nil }
        let genresList: GenreList?
        switch type {
        case .movie:
            genresList = movieGenresList
        case .tvShow:
            genresList = tvShowGenresList
        }
        return SimilarViewModel(mediaItem: mediaItem, genresList: genresList)
    }

    func searchListViewModel<T: MediaProtocol>(type: MovieDatabaseAPI.MediaType) -> SearchListViewModel<T> {
        switch type {
        case .movie:
            let pages = moviePages.compactMap { $0 as? Page<T> }
            return SearchListViewModel(query: query, mediaType: type, pages: pages, genresList: movieGenresList)
        case .tvShow:
            let pages = tvShowPages.compactMap { $0 as? Page<T> }
            return SearchListViewModel(query: query, mediaType: type, pages: pages, genresList: tvShowGenresList)
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

    private func movieDetail(for id: Movie.ID) -> MediaDetailViewModel? {
        guard let movieItem = movieItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: movieItem)
    }

    private func tvShowDetail(for id: TVShow.ID) -> MediaDetailViewModel? {
        guard let tvShowItem = tvShowItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: tvShowItem)
    }
}
