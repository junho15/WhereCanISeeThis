struct WatchProviderList: Decodable {
    let link: String?
    let flatrate: [WatchProvider]?
    let buy: [WatchProvider]?
    let ads: [WatchProvider]?
    let rent: [WatchProvider]?
    let free: [WatchProvider]?
}
