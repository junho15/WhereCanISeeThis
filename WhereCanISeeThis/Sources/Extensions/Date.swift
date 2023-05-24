import Foundation

extension Date {
    private static let yearDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy")
        return formatter
    }()

    var year: String? {
        return Self.yearDateFormatter.string(from: self)
    }
}
