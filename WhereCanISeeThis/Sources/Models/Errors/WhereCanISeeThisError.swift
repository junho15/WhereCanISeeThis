import Foundation

enum WhereCanISeeThisError: Error {
    case invalidRequest
    case networkError(error: Error)
    case badStatus
}

extension WhereCanISeeThisError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("INVALID_REQUEST", comment: "Invalid Request")
        case .networkError(error: let error):
            return String(format: NSLocalizedString("NETWORK_ERROR", comment: "Network Error"),
                          error.localizedDescription)
        case .badStatus:
            return NSLocalizedString("BAD_STATUS", comment: "Bad Status")
        }
    }
}
