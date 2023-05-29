struct WatchProviderResult: Decodable {
    typealias Country = String

    let id: Int
    let results: [Country: WatchProviderList]?
}
