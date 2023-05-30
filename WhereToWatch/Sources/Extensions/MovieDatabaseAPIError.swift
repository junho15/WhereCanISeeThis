import Foundation
import MovieDatabaseAPI

extension MovieDatabaseAPIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return NSLocalizedString("DECODING_ERROR", comment: "Decoding Error")
        case .invalidRequest:
            return NSLocalizedString("INVALID_REQUEST", comment: "Invalid Request")
        case .networkError(error: let error):
            return String(format: NSLocalizedString("NETWORK_ERROR", comment: "Network Error"),
                          error.localizedDescription)
        case .badStatus:
            return NSLocalizedString("BAD_STATUS", comment: "Bad Status")
        case .emptyData:
            return NSLocalizedString("EMPTY_DATA", comment: "Empty Data")
        }
    }
}
