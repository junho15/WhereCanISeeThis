import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let trendingViewController = TrendingViewController()
        let trendingTabBarItem = UITabBarItem(
            title: "Trending", image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle"), selectedImage: nil
        )
        trendingViewController.tabBarItem = trendingTabBarItem
        let trendingNavigationController = UINavigationController(rootViewController: trendingViewController)

        let searchViewController = SearchViewController()
        let searchTabBarItem = UITabBarItem(
            title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil
        )
        searchViewController.tabBarItem = searchTabBarItem
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)

        let favoriteViewController = FavoriteViewController()
        let favoriteTabBarItem = UITabBarItem(
            title: "Favorite", image: UIImage(systemName: "list.star"), selectedImage: nil
        )
        favoriteViewController.tabBarItem = favoriteTabBarItem
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)

        viewControllers = [trendingNavigationController, searchNavigationController, favoriteNavigationController]
    }
}
