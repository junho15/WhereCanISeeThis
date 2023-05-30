import Foundation

public struct TVShow: MediaProtocol {
    public let id: Int
    public let name: String?
    public let overview: String?
    public let posterPath: String?
    public let firstAirDateText: String?
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIds: [Int]?
    public let originCountry: [String]?
    public let originalLanguage: String?
    public let originalName: String?
    public let popularity: Double?
    public let voteAverage: Double?
    public let voteCount: Int?

    public var firstAirDate: Date? {
        guard let firstAirDateText else { return nil }
        return firstAirDateText.date()
    }

    public var title: String? {
        return name
    }

    public var mediaType: MediaType {
        return .tvShow
    }

    public var date: Date? {
        return firstAirDate
    }
}

extension TVShow {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case posterPath
        case firstAirDateText = "firstAirDate"
        case adult
        case backdropPath
        case genreIds
        case originCountry
        case originalLanguage
        case originalName
        case popularity
        case voteAverage
        case voteCount
    }
}
