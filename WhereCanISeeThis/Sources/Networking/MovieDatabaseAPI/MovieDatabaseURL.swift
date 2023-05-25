import Foundation

enum MovieDatabaseURL {
    private static let apiKey = Secrets.apiKey
    private static let baseURL = "api.themoviedb.org"
    private static let imageURL = "image.tmdb.org"
    private static let scheme = "https"

    case searchMovies(searchQuery: MoviesSearchQuery)
    case searchTVShows(searchQuery: TVShowsSearchQuery)
    case fetchMovieWatchProviders(movieID: Int)
    case fetchTVShowWatchProviders(tvShowID: Int)
    case fetchMovieGenresList(language: String)
    case fetchTVShowGenresList(language: String)
    case fetchImage(imageSize: ImageSize, imagePath: String)
    case fetchTrendingMovies(timeWindow: TimeWindow, language: String)
    case fetchTrendingTVShows(timeWindow: TimeWindow, language: String)
}

extension MovieDatabaseURL {
    var url: URL? {
        switch self {
        case .searchMovies(let searchQuery):
            return url(path: path, queryItems: searchQuery.queryItems)
        case .searchTVShows(let searchQuery):
            return url(path: path, queryItems: searchQuery.queryItems)
        case .fetchMovieWatchProviders:
            return url(path: path)
        case .fetchTVShowWatchProviders:
            return url(path: path)
        case .fetchMovieGenresList(let language):
            return url(path: path, queryItems: ["language": language])
        case .fetchTVShowGenresList(let language):
            return url(path: path, queryItems: ["language": language])
        case .fetchImage:
            return url(path: path)
        case .fetchTrendingMovies(_, let language):
            return url(path: path, queryItems: ["language": language])
        case .fetchTrendingTVShows(_, let language):
            return url(path: path, queryItems: ["language": language])
        }
    }

    private var path: String {
        switch self {
        case .searchMovies:
            return "/3/search/movie"
        case .searchTVShows:
            return "/3/search/tv"
        case .fetchMovieWatchProviders(let movieID):
            return "/3/movie/\(movieID)/watch/providers"
        case .fetchTVShowWatchProviders(let tvShowID):
            return "/3/tv/\(tvShowID)/watch/providers"
        case .fetchMovieGenresList:
            return "/3/genre/movie/list"
        case .fetchTVShowGenresList:
            return "/3/genre/tv/list"
        case .fetchImage(let imageSize, let imagePath):
            return "/t/p\(imageSize.stringValue)\(imagePath)"
        case .fetchTrendingMovies(let timeWindow, _):
            return "/3/trending/movie\(timeWindow.stringValue)"
        case .fetchTrendingTVShows(let timeWindow, _):
            return "/3/trending/tv\(timeWindow.stringValue)"
        }
    }

    private var host: String {
        switch self {
        case .fetchImage:
            return Self.imageURL
        default:
            return Self.baseURL
        }
    }

    private func url(path: String, queryItems: [String: String] = [:]) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Self.scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = urlQueryItems(by: queryItems)
        return urlComponents.url
    }

    private func urlQueryItems(by queryItems: [String: String]) -> [URLQueryItem] {
        return queryItems.reduce(into: [URLQueryItem(name: "api_key", value: Self.apiKey)]) {
            $0.append(URLQueryItem(name: $1.key, value: $1.value))
        }
    }
}

extension MovieDatabaseURL {
    struct MoviesSearchQuery {
        var language: String?
        var query: String
        var page: Int?
        var includeAdult: Bool?
        var region: String?
        var year: Int?
        var primaryReleaseYear: Int?

        fileprivate var queryItems: [String: String] {
            let items: [String: Any?] = [
                "language": language,
                "page": page,
                "include_adult": includeAdult,
                "region": region,
                "year": year,
                "primary_release_year": primaryReleaseYear
            ]

            return items.reduce(into: ["query": query]) {
                if let value = $1.value {
                    $0[$1.key] = "\(value)"
                }
            }
        }

        init(
            language: String? = nil,
            query: String,
            page: Int? = nil,
            includeAdult: Bool? = true,
            region: String? = nil,
            year: Int? = nil,
            primaryReleaseYear: Int? = nil
        ) {
            self.language = language
            self.query = query
            self.page = page
            self.includeAdult = includeAdult
            self.region = region
            self.year = year
            self.primaryReleaseYear = primaryReleaseYear
        }
    }

    struct TVShowsSearchQuery {
        var language: String?
        var query: String
        var page: Int?
        var includeAdult: Bool?
        var firstAirDateYear: Int?

        fileprivate var queryItems: [String: String] {
            let items: [String: Any?] = [
                "language": language,
                "page": page,
                "include_adult": includeAdult,
                "first_air_date_year": firstAirDateYear
            ]

            return items.reduce(into: ["query": query]) {
                if let value = $1.value {
                    $0[$1.key] = "\(value)"
                }
            }
        }

        init(
            language: String? = nil,
            query: String,
            page: Int? = nil,
            includeAdult: Bool? = true,
            firstAirDateYear: Int? = nil) {
                self.language = language
                self.query = query
                self.page = page
                self.includeAdult = includeAdult
                self.firstAirDateYear = firstAirDateYear
            }
    }

    enum ImageSize {
        case original
        case w500

        fileprivate var stringValue: String {
            switch self {
            case .original: return "/original"
            case .w500: return "/w500"
            }
        }
    }

    enum TimeWindow {
        case day
        case week

        fileprivate var stringValue: String {
            switch self {
            case .day: return "/day"
            case .week: return "/week"
            }
        }
    }
}
