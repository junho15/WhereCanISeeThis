import UIKit

enum AttributedStringMaker {
    case trendingHeader(title: String)
    case searchListHeader(title: String, count: Int)
    case mediaDetailHeader(title: String)
    case watchProviderName(name: String)

    var attributedString: NSAttributedString {
        switch self {
        case .trendingHeader(let title):
            return trendingHeaderAttributedString(title: title)
        case .searchListHeader(let title, let count):
            return searchListHeader(title: title, count: count)
        case .mediaDetailHeader(title: let title):
            return mediaDetailHeader(title: title)
        case .watchProviderName(let name):
            return watchProviderName(name: name)
        }
    }

    private func trendingHeaderAttributedString(title: String) -> NSAttributedString {
        return NSAttributedString(
            string: title,
            attributes: [.font: UIFont.preferredFont(forTextStyle: .title3),
                         .foregroundColor: UIColor.systemPink]
        )
    }

    private func searchListHeader(title: String, count: Int) -> NSAttributedString {
        return NSAttributedString(
            string: "\(title) (\(count))",
            attributes: [.font: UIFont.preferredFont(forTextStyle: .title3),
                         .foregroundColor: UIColor.systemBlue]
        )
    }

    private func mediaDetailHeader(title: String) -> NSAttributedString {
        return NSAttributedString(string: title, attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
    }

    private func watchProviderName(name: String) -> NSAttributedString {
        return NSAttributedString(string: name, attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
    }
}