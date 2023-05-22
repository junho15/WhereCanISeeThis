import UIKit

final class MovieDatabaseAPIClient {
    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func searchMovies(
        query: String,
        language: String? = nil,
        page: Int? = nil,
        includeAdult: Bool? = true,
        region: String? = nil,
        year: Int? = nil,
        primaryReleaseYear: Int? = nil
    ) async throws -> Page<Movie> {
        guard let url = MovieDatabaseURL.searchMovies(searchQuery: .init(
            language: language,
            query: query,
            page: page,
            includeAdult: includeAdult,
            region: region,
            year: year,
            primaryReleaseYear: primaryReleaseYear
        )).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        do {
            return try JSONDecoder.movieDatabaseDecoder.decode(Page<Movie>.self, from: data)
        } catch {
            throw WhereCanISeeThisError.decodingError
        }

    }

    func searchTVShows(
        query: String,
        language: String? = nil,
        page: Int? = nil,
        includeAdult: Bool? = true,
        firstAirDateYear: Int? = nil
    ) async throws -> Page<TVShow> {
        guard let url = MovieDatabaseURL.searchTVShows(searchQuery: .init(
            language: language,
            query: query,
            page: page,
            includeAdult: includeAdult,
            firstAirDateYear: firstAirDateYear
        )).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        do {
            return try JSONDecoder.movieDatabaseDecoder.decode(Page<TVShow>.self, from: data)
        } catch {
            throw WhereCanISeeThisError.decodingError
        }
    }

    func fetchMovieWatchProviders(movieID: Int) async throws -> WatchProviderResult {
        guard let url = MovieDatabaseURL.fetchMovieWatchProviders(movieID: movieID).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        do {
            return try JSONDecoder.movieDatabaseDecoder.decode(WatchProviderResult.self, from: data)
        } catch {
            throw WhereCanISeeThisError.decodingError
        }
    }

    func fetchTVShowWatchProviders(tvShowID: Int) async throws -> WatchProviderResult {
        guard let url = MovieDatabaseURL.fetchTVShowWatchProviders(tvShowID: tvShowID).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        do {
            return try JSONDecoder.movieDatabaseDecoder.decode(WatchProviderResult.self, from: data)
        } catch {
            throw WhereCanISeeThisError.decodingError
        }
    }

    func fetchMovieGenresList(language: String) async throws -> GenreList {
        guard let url = MovieDatabaseURL.fetchMovieGenresList(language: language).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        do {
            return try JSONDecoder.movieDatabaseDecoder.decode(GenreList.self, from: data)
        } catch {
            throw WhereCanISeeThisError.decodingError
        }
    }

    func fetchTVShowGenresList(language: String) async throws -> GenreList {
        guard let url = MovieDatabaseURL.fetchTVShowGenresList(language: language).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        do {
            return try JSONDecoder.movieDatabaseDecoder.decode(GenreList.self, from: data)
        } catch {
            throw WhereCanISeeThisError.decodingError
        }
    }

    func fetchImage(imageSize: MovieDatabaseURL.ImageSize, imagePath: String) async throws -> UIImage? {
        guard let url = MovieDatabaseURL.fetchImage(imageSize: imageSize, imagePath: imagePath).url else {
            throw WhereCanISeeThisError.invalidRequest
        }

        let data = try await session.execute(url: url)

        return UIImage(data: data)
    }
}