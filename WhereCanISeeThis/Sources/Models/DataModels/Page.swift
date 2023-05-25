struct Page<Result: MediaProtocol>: Decodable {
    let page: Int
    let results: [Result]
    let totalPages: Int
    let totalResults: Int
}
