import UIKit
import MovieDatabaseAPI

protocol MediaItemViewModelProtocol {
    func mediaItem(for id: MediaItem.ID, type: MediaType?) -> MediaItem?
    func image(imageSize: MovieDatabaseURL.ImageSize, imagePath: String) async -> UIImage?
    func mediaDetailViewModel(for id: MediaItem.ID, type: MediaType?) -> MediaDetailViewModel?
    func similarViewModel<T: MediaProtocol>(for id: MediaItem.ID, type: MediaType?) -> SimilarViewModel<T>?
}
