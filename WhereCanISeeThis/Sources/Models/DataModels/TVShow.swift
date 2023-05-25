import Foundation

struct TVShow: MediaProtocol {
    let id: Int
    let name: String?
    let overview: String?
    let posterPath: String?
    let firstAirDateText: String?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let popularity: Double?
    let voteAverage: Double?
    let voteCount: Int?

    var firstAirDate: Date? {
        guard let firstAirDateText else { return nil }
        return DateFormatter().date(from: firstAirDateText)
    }

    var title: String? {
        return name
    }

    var mediaType: MediaType {
        return .tvShow
    }

    var date: Date? {
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
