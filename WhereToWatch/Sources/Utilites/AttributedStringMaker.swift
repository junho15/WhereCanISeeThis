import UIKit

enum AttributedStringMaker {
    case trendingHeader(title: String)
    case searchListHeader(title: String, count: Int)
    case mediaDetailHeader(title: String)
    case watchProviderName(name: String)
    case posterDetail(title: String, year: String, genre: String)
    case favoriteTitle(title: String)
    case favoriteDateGenre(date: String, genre: String)

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
        case .posterDetail(let title, let year, let genre):
            return posterDetail(title: title, year: year, genre: genre)
        case .favoriteTitle(let title):
            return favoriteTitle(title: title)
        case .favoriteDateGenre(let date, let genre):
            return favoriteDateGenre(date: date, genre: genre)
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

    private func posterDetail(title: String, year: String, genre: String) -> NSAttributedString {
        let titleAttributedString = NSAttributedString(
            string: title,
            attributes: [.font: UIFont.preferredFont(forTextStyle: .headline), .foregroundColor: UIColor.white])
        let yearGenreAttributedString = NSAttributedString(
            string: "\n\(year) \(genre)",
            attributes: [.font: UIFont.preferredFont(forTextStyle: .footnote), .foregroundColor: UIColor.white])
        return [titleAttributedString, yearGenreAttributedString].reduce(into: NSMutableAttributedString()) {
            $0.append($1)
        }
    }

    private func favoriteTitle(title: String) -> NSAttributedString {
        return NSAttributedString(string: title, attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
    }

    private func favoriteDateGenre(date: String, genre: String) -> NSAttributedString {
        return NSAttributedString(
            string: "\(date)\n\(genre)",
            attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1)]
        )
    }
}
