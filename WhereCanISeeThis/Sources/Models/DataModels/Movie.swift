import Foundation

struct Movie: PageResultProtocol {
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
        return DateFormatter().date(from: releaseDateText)
    }
}
