import UIKit

extension UISearchBar {
    enum SearchType {
        case media
    }

    convenience init(_ searchType: SearchType, delegate: UISearchBarDelegate? = nil) {
        self.init()
        self.delegate = delegate
        configure(searchType)
    }

    private func configure(_ searchType: SearchType) {
        switch searchType {
        case .media:
            self.showsCancelButton = true
            self.placeholder = NSLocalizedString("SEARCH_BAR_PLACEHOLDER", comment: "SearchBar Placeholder")
        }
    }
}
