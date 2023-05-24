import UIKit

final class TrendingViewController: UICollectionViewController {
    private let trendingViewModel: TrendingViewModel

    init(trendingViewModel: TrendingViewModel = TrendingViewModel()) {
        self.trendingViewModel = trendingViewModel
        var configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        configuration.backgroundColor = Constants.collectionViewBackgroundColor
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewBackgroundColor
    }
}

extension TrendingViewController {
    private enum Constants {
        static let viewBackgroundColor = UIColor.systemBackground
        static let collectionViewBackgroundColor = UIColor.systemBackground
    }
}
