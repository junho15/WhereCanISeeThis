import Foundation

struct TVShow: PageResultProtocol {
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
