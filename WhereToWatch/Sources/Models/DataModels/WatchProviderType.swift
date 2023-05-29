import Foundation

enum WatchProviderType: Decodable, CaseIterable {
    case flatrate
    case buy
    case ads
    case rent
    case free
}

extension WatchProviderType {
    var title: String {
        switch self {
        case .flatrate:
            return NSLocalizedString("WATCH_PROVIDER_TYPE_FLATRATE", comment: "WatchProviderType Flatrate Title")
        case .buy:
            return NSLocalizedString("WATCH_PROVIDER_TYPE_BUY", comment: "WatchProviderType Buy Title")
        case .ads:
            return NSLocalizedString("WATCH_PROVIDER_TYPE_ADS", comment: "WatchProviderType Ads Title")
        case .rent:
            return NSLocalizedString("WATCH_PROVIDER_TYPE_RENT", comment: "WatchProviderType Rent Title")
        case .free:
            return NSLocalizedString("WATCH_PROVIDER_TYPE_FREE", comment: "WatchProviderType Free Title")
        }
    }
}
