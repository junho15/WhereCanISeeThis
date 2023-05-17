struct Page<Result: PageResultProtocol>: Decodable {
    let page: Int
    let results: [Result]
    let totalPages: Int
    let totalResults: Int
}

protocol PageResultProtocol: Identifiable, Decodable { }
