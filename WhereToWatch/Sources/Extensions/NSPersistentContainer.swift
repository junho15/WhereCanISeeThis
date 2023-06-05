import CoreData

extension NSPersistentContainer {
    func saveContext() throws {
        guard viewContext.hasChanges else { return }
        try viewContext.save()
    }
}
