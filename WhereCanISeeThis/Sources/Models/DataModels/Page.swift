struct Page<Result: PageResultProtocol> {
    let page: Int
    let result: [Result]
    let totalPages: Int
    let totalResults: Int
}

protocol PageResultProtocol: Identifiable, Decodable { }
