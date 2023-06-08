import UIKit
import MovieDatabaseAPI

final class TrendingViewModel: MediaItemViewModelProtocol {

    // MARK: Properties

    private let movieDatabaseAPIClient: MovieDatabaseAPI.MovieDatabaseAPIClient
    private var moviePage: Page<Movie>?
    private var tvShowPage: Page<TVShow>?
    private var movieGenresList: GenreList?
    private var tvShowGenresList: GenreList?
    private var onError: ((String) -> Void)?
    private var onUpdate: (() -> Void)?

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

    // MARK: Lifecycle

    init(
        movieDatabaseAPIClient: MovieDatabaseAPI.MovieDatabaseAPIClient = MovieDatabaseAPIClient(
            apiKey: Secrets.apiKey
        ),
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

// MARK: - Methods

extension TrendingViewModel {
    enum Action {
        case fetchTrendingMovies(MovieDatabaseURL.TimeWindow)
        case fetchTrendingTVShows(MovieDatabaseURL.TimeWindow)
    }

    func action(_ action: Action) {
        switch action {
        case .fetchTrendingMovies(let timeWindow):
            fetchTrendingMovies(of: timeWindow)
        case .fetchTrendingTVShows(let timeWindow):
            fetchTrendingTVShows(of: timeWindow)
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
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
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

    private func fetchTrendingMovies(of timeWindow: MovieDatabaseURL.TimeWindow) {
        Task {
            do {
                guard let language,
                      let country else { return }

                if movieGenresList == nil {
                    self.movieGenresList = try await movieDatabaseAPIClient.fetchMovieGenresList(language: language)
                }

                let languageCode = "\(language)-\(country)"
                self.moviePage = try await movieDatabaseAPIClient.fetchTrendingMovies(
                    timeWindow: timeWindow,
                    language: languageCode
                )
                await MainActor.run {
                    onUpdate?()
                }
            } catch let error as MovieDatabaseAPIError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }

    private func fetchTrendingTVShows(of timeWindow: MovieDatabaseURL.TimeWindow) {
        Task {
            do {
                guard let language,
                      let country else { return }

                if tvShowGenresList == nil {
                    self.tvShowGenresList = try await movieDatabaseAPIClient.fetchTVShowGenresList(language: language)
                }

                let languageCode = "\(language)-\(country)"
                self.tvShowPage = try await movieDatabaseAPIClient.fetchTrendingTVShows(
                    timeWindow: timeWindow,
                    language: languageCode
                )
                await MainActor.run {
                    onUpdate?()
                }
            } catch let error as MovieDatabaseAPIError {
                await MainActor.run {
                    onError?(error.localizedDescription)
                }
            }
        }
    }

    private func movieDetail(for id: Movie.ID) -> MediaDetailViewModel? {
        guard let movieItem = movieItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: movieItem)
    }

    private func tvShowDetail(for id: TVShow.ID) -> MediaDetailViewModel? {
        guard  let tvShowItem = tvShowItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: tvShowItem)
    }
}
