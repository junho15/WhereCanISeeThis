import CoreData

final class FavoriteService {
    typealias FetchRequest = NSFetchRequest<MediaItemEntity>

    static let shared = FavoriteService()

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.persistentContainerName)
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()

    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private var fetchRequest: FetchRequest {
        return MediaItemEntity.fetchRequest()
    }

    private init() { }

    func contains(_ id: Int) throws -> Bool {
        let result = try fetch(id: id)
        return result.isEmpty == false
    }

    func fetch(
        sortOption: SortOption = .registrationDate, query: String? = nil, offset: Int? = nil, limit: Int? = nil
    ) throws -> [FavoriteMediaItem] {
        let request = fetchRequest
        request.sortDescriptors = [sortOption.sortDescriptor]
        if let query {
            request.predicate = NSPredicate(format: Constants.titlePredicateFormat, query)
        }
        if let offset,
           let limit {
            request.fetchOffset = offset
            request.fetchLimit = limit
        }
        let result = try context.fetch(request)
        return result.compactMap { FavoriteMediaItem(mediaItemEntity: $0) }
    }

    func save(_ favoriteMediaItem: FavoriteMediaItem) throws {
        let mediaItemEntity = MediaItemEntity(context: context)
        mediaItemEntity.id = Int64(favoriteMediaItem.id)
        mediaItemEntity.genre = favoriteMediaItem.genre
        mediaItemEntity.overView = favoriteMediaItem.overView
        mediaItemEntity.mediaTypeText = favoriteMediaItem.mediaType.rawValue
        mediaItemEntity.backdropPath = favoriteMediaItem.backdropPath
        mediaItemEntity.posterPath = favoriteMediaItem.posterPath
        mediaItemEntity.date = favoriteMediaItem.date
        mediaItemEntity.title = favoriteMediaItem.title
        mediaItemEntity.registrationDate = favoriteMediaItem.registrationDate
        try persistentContainer.saveContext()
    }

    func delete(_ id: Int) throws {
        let result = try fetch(id: id)
        guard let deleted = result.first else { return }
        context.delete(deleted)
        try persistentContainer.saveContext()
    }

    private func fetch(id: Int) throws -> [MediaItemEntity] {
        let request = fetchRequest
        request.predicate = NSPredicate(format: Constants.idPredicateFormat, id)
        return try context.fetch(request)
    }
}

extension FavoriteService {
    enum SortOption {
        case registrationDate
        case reverseRegistrationDate
        case title
        case reverseTitle

        fileprivate var sortDescriptor: NSSortDescriptor {
            switch self {
            case .registrationDate:
                return NSSortDescriptor(key: "registrationDate", ascending: true)
            case .reverseRegistrationDate:
                return NSSortDescriptor(key: "registrationDate", ascending: false)
            case .title:
                return NSSortDescriptor(key: "title", ascending: true)
            case .reverseTitle:
                return NSSortDescriptor(key: "title", ascending: false)
            }
        }
    }
}

extension FavoriteService {
    private enum Constants {
        static let persistentContainerName = "Model"
        static let titlePredicateFormat = "title CONTAINS %@"
        static let idPredicateFormat = "entityID == %lld"
    }
}
