import Foundation

public struct Movie: MediaProtocol {
    public let id: Int
    public let title: String?
    public let overview: String?
    public let posterPath: String?
    public let releaseDateText: String?
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIds: [Int]?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let popularity: Double?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?

    public var releaseDate: Date? {
        guard let releaseDateText else { return nil }
        return releaseDateText.date()
    }

    public var mediaType: MediaType {
        return .movie
    }

    public var date: Date? {
        return releaseDate
    }
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath
        case releaseDateText = "releaseDate"
        case adult
        case backdropPath
        case genreIds
        case originalLanguage
        case originalTitle
        case popularity
        case video
        case voteAverage
        case voteCount
    }
}
