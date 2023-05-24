import UIKit

protocol MediaItemViewModelProtocol {
    func movieItem(for id: Movie.ID) -> MediaItem?
    func tvShowItem(for id: TVShow.ID) -> MediaItem?
    func image(imageSize: MovieDatabaseURL.ImageSize, imagePath: String) async -> UIImage?
}
