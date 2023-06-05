import Foundation
import MovieDatabaseAPI

protocol MediaItemProtocol: Identifiable {
    var id: Int { get }
    var genre: String? { get }
    var title: String? { get }
    var date: String? { get }
    var posterPath: String? { get }
    var backdropPath: String? { get }
    var mediaType: MediaType { get }
    var overView: String? { get }
}
