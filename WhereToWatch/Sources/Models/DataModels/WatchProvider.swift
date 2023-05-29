struct WatchProvider: Identifiable, Hashable {
    let id: Int
    let logoPath: String?
    let providerName: String?
    let displayPriority: Int?
}

extension WatchProvider: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "providerId"
        case logoPath
        case providerName
        case displayPriority
    }
}
