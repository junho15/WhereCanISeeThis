import Foundation
import MovieDatabaseAPI

struct FavoriteMediaItem: MediaItemProtocol {
    let id: Int
    let genre: String?
    let title: String?
    let date: String?
    let posterPath: String?
    let backdropPath: String?
    let mediaType: MediaType
    let overView: String?
    var registrationDate: Date? = Date()

    init?(mediaItemEntity: MediaItemEntity) {
        guard let mediaType = MediaType(rawValue: mediaItemEntity.mediaTypeText) else {
            return nil
        }
        self.id = Int(mediaItemEntity.id)
        self.genre = mediaItemEntity.genre
        self.title = mediaItemEntity.genre
        self.date = mediaItemEntity.date
        self.posterPath = mediaItemEntity.posterPath
        self.backdropPath = mediaItemEntity.backdropPath
        self.mediaType = mediaType
        self.overView = mediaItemEntity.overView
        self.registrationDate = mediaItemEntity.registrationDate
    }

    init(mediaItem: any MediaItemProtocol) {
        self.id = mediaItem.id
        self.genre = mediaItem.genre
        self.title = mediaItem.title
        self.date = mediaItem.date
        self.posterPath = mediaItem.posterPath
        self.backdropPath = mediaItem.backdropPath
        self.mediaType = mediaItem.mediaType
        self.overView = mediaItem.overView
    }
}
