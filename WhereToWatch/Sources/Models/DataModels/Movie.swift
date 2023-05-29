import Foundation

struct Movie: MediaProtocol {
    let id: Int
    let title: String?
    let overview: String?
    let posterPath: String?
    let releaseDateText: String?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let popularity: Double?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    var releaseDate: Date? {
        guard let releaseDateText else { return nil }
        return releaseDateText.date()
    }

    var mediaType: MediaType {
        return .movie
    }

    var date: Date? {
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
