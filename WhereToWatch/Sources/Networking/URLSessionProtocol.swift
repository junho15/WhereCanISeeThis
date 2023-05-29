import Foundation

protocol URLSessionProtocol {
    func execute(url: URL) async throws -> Data
}

extension URLSession: URLSessionProtocol {
    func execute(url: URL) async throws -> Data {
        let (data, response) = try await data(from: url)
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else {
            throw WhereToWatchError.badStatus
        }
        return data
    }
}
