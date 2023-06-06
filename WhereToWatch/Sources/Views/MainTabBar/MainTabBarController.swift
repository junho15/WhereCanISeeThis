import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let trendingViewController = TrendingViewController()
        let trendingTabBarItem = UITabBarItem(
            title: Constants.trendingTabTitle, image: Constants.trendingTabImage, selectedImage: nil
        )
        trendingViewController.tabBarItem = trendingTabBarItem
        let trendingNavigationController = UINavigationController(rootViewController: trendingViewController)

        let searchViewController = SearchViewController()
        let searchTabBarItem = UITabBarItem(
            title: Constants.searchTabTitle, image: Constants.searchTabImage, selectedImage: nil
        )
        searchViewController.tabBarItem = searchTabBarItem
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)

        let favoriteViewController = FavoriteViewController()
        let favoriteTabBarItem = UITabBarItem(
            title: Constants.favoriteTabTitle, image: Constants.favoriteTabImage, selectedImage: nil
        )
        favoriteViewController.tabBarItem = favoriteTabBarItem
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)

        viewControllers = [trendingNavigationController, searchNavigationController, favoriteNavigationController]
    }
}

extension MainTabBarController {
    private enum Constants {
        static let trendingTabTitle = NSLocalizedString("TRENDING_TAB_TITLE", comment: "Trending Tab Title")
        static let searchTabTitle = NSLocalizedString("SEARCH_TAB_TITLE", comment: "Search Tab Title")
        static let favoriteTabTitle = NSLocalizedString("FAVORITE_TAB_TITLE", comment: "Favorite Tab Title")
        static let trendingTabImage = UIImage(systemName: "chart.line.uptrend.xyaxis.circle")
        static let searchTabImage = UIImage(systemName: "magnifyingglass.circle")
        static let favoriteTabImage = UIImage(systemName: "star.circle")
    }
}
