import Foundation
import CoreData
import MovieDatabaseAPI

extension MediaItemEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MediaItemEntity> {
        return NSFetchRequest<MediaItemEntity>(entityName: "MediaItemEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var genre: String?
    @NSManaged public var overView: String?
    @NSManaged public var mediaTypeText: String
    @NSManaged public var backdropPath: String?
    @NSManaged public var posterPath: String?
    @NSManaged public var date: String?
    @NSManaged public var title: String?
    @NSManaged public var registrationDate: Date?
}

extension MediaItemEntity: Identifiable {
}
