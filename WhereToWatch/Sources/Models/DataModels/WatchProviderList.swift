struct WatchProviderList: Decodable {
    let link: String?
    var results: [WatchProviderType: [WatchProvider]] = [:]

    enum CodingKeys: CodingKey {
        case link
        case flatrate
        case buy
        case ads
        case rent
        case free
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.results[.flatrate] = try container.decodeIfPresent([WatchProvider].self, forKey: .flatrate)
        self.results[.buy] = try container.decodeIfPresent([WatchProvider].self, forKey: .buy)
        self.results[.ads] = try container.decodeIfPresent([WatchProvider].self, forKey: .ads)
        self.results[.rent] = try container.decodeIfPresent([WatchProvider].self, forKey: .rent)
        self.results[.free] = try container.decodeIfPresent([WatchProvider].self, forKey: .free)
    }
}
