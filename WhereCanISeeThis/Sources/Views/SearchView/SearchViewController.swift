import UIKit

class SearchViewController: UICollectionViewController {
    private let searchViewModel: SearchViewModel
    private var searchBar: UISearchBar?
    private var tapGestureRecognizer: UIGestureRecognizer?

    init(searchViewModel: SearchViewModel, query: String? = nil) {
        self.searchViewModel = searchViewModel

        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        configuration.headerMode = .firstItemInSection
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)

        collectionView.isScrollEnabled = false
        configureSearchBar()
        searchBar?.text = query
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewBackgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        addTapGestureRecognizer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeTapGestureRecognizer()
    }

    private func configureSearchBar() {
        searchBar = UISearchBar(.media, delegate: self)
        navigationItem.titleView = searchBar
    }

    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissSearchBarKeyboard))
        self.tapGestureRecognizer = tapGestureRecognizer
        tapGestureRecognizer.cancelsTouchesInView = false
        collectionView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func removeTapGestureRecognizer() {
        guard let tapGestureRecognizer else { return }
        collectionView.removeGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func dismissSearchBarKeyboard() {
        searchBar?.endEditing(true)
    }
}

extension SearchViewController: UISearchBarDelegate {

}

extension SearchViewController {
    private enum Constants {
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemBackground
    }
}
