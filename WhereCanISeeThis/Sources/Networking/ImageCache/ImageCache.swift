import UIKit

final class ImageCache: ImageCacheProtocol {
    static let shared = ImageCache()

    private var cache = NSCache<NSURL, UIImage>()

    func store(_ image: UIImage, forKey url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }

    func cachedImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }
}
