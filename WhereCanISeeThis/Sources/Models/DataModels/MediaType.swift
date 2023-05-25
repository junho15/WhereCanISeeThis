import Foundation

enum MediaType: CaseIterable {
    case movie
    case tvShow

    var title: String {
        switch self {
        case .movie:
            return NSLocalizedString("MOVIE_TITLE", comment: "Movie Title")
        case .tvShow:
            return NSLocalizedString("TVSHOW_TITLE", comment: "TVShow Title")
        }
    }

    var trendingTitle: String {
        return String(format: NSLocalizedString("TRENDING", comment: "Trending (Media)"), title)
    }
}
