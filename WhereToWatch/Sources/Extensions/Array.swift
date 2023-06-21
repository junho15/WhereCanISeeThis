import Foundation

extension Array {
    func deduplicate() -> [Element] where Element: Equatable {
        return self.reduce(into: []) { result, element in
            if result.contains(where: { $0 == element }) == false {
                result.append(element)
            }
        }
    }
}
