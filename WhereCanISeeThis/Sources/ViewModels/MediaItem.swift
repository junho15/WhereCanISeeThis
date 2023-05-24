import UIKit

struct MediaItem {
    var genre: String?
    var title: String? {
        return media.title
    }
    var date: String? {
        return media.date?.year
    }
    var posterPath: String? {
        return media.posterPath
    }
    private let media: MediaProtocol

    init(media: MediaProtocol, genreList: GenreList) {
        self.media = media
        guard let genreIds = media.genreIds else { return }
        self.genre = genreList.genres.filter { genreIds.contains($0.id) }.compactMap { $0.name }.joined(separator: ", ")
    }
}
