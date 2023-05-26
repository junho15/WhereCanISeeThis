import UIKit

enum AttributedStringMaker {
    case trending(title: String)

    var attributedString: NSAttributedString {
        switch self {
        case .trending(let title):
            return trendingAttributedString(title: title)
        }
    }

    func trendingAttributedString(title: String) -> NSAttributedString {
        return NSAttributedString(
            string: title,
            attributes: [.font: UIFont.preferredFont(forTextStyle: .title3),
                         .foregroundColor: UIColor.systemPink]
        )
    }
}
