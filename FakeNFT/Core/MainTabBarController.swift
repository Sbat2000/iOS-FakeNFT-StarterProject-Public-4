import UIKit

final class MainTabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
		applyStyle()
	}
}

private extension MainTabBarController {
	func setup() {
		let pages: [TabbarPage] = [.profile, .catalog, .shoppingCart, .statistics]
			.sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
		let controllers: [UINavigationController] = pages.map { getTabController($0) }

		prepareTabbarController(withTabControllers: controllers)
	}

	func applyStyle() {
		view.backgroundColor = Theme.color(usage: .white)
	}

	func getTabController(_ page: TabbarPage) -> UINavigationController {
		let navController = UINavigationController(rootViewController: page.pageRootViewController())

		navController.tabBarItem = UITabBarItem(
			title: page.pageTitleValue(),
			image: page.pageIconValue(),
			tag: page.pageOrderNumber()
		)

		return navController
	}

	func prepareTabbarController(withTabControllers tabControllers: [UIViewController]) {
		setViewControllers(tabControllers, animated: true)
		selectedIndex = TabbarPage.profile.pageOrderNumber()

		let tabBarItemsAppearance = UITabBarItemAppearance()
		tabBarItemsAppearance.normal.titleTextAttributes = [
			NSAttributedString.Key.font: Theme.font(style: .caption),
			NSAttributedString.Key.foregroundColor: Theme.color(usage: .black)
		]
		tabBarItemsAppearance.normal.iconColor = Theme.color(usage: .black)

		let tabBarAppearance = UITabBarAppearance()
		tabBarAppearance.backgroundColor = Theme.color(usage: .white)
		tabBarAppearance.stackedLayoutAppearance = tabBarItemsAppearance

		tabBar.standardAppearance = tabBarAppearance

		if #available(iOS 15.0, *) {
			tabBar.scrollEdgeAppearance = tabBarAppearance
		}

		tabBar.tintColor = Theme.color(usage: .accent)

		tabBar.isTranslucent = false
		tabBar.clipsToBounds = true

		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.configureWithTransparentBackground()
		navBarAppearance.backgroundColor = Theme.color(usage: .white)
		UINavigationBar.appearance().standardAppearance = navBarAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
	}
}

// MARK: - Appearance
private extension MainTabBarController {

	enum TabbarPage: Int {
		case profile
		case catalog
		case shoppingCart
		case statistics

		func pageOrderNumber() -> Int {
			switch self {
			case .profile:
				return .zero
			case .catalog:
				return 1 // swiftlint:disable:this numbers_smell
			case .shoppingCart:
				return 2 // swiftlint:disable:this numbers_smell
			case .statistics:
				return 3 // swiftlint:disable:this numbers_smell
			}
		}
		func pageTitleValue() -> String {
			switch self {
			case .profile:
				return Appearance.profileTabTitle
			case .catalog:
				return Appearance.catalogTabTitle
			case .shoppingCart:
				return Appearance.shoppingCartTabTitle
			case .statistics:
				return Appearance.statisticsTabTitle
			}
		}
		func pageIconValue() -> UIImage {
			switch self {
			case .profile:
				return Appearance.tabProfileIcon
			case .catalog:
				return Appearance.tabCatalogIcon
			case .shoppingCart:
				return Appearance.tabShoppingCartIcon
			case .statistics:
				return Appearance.tabStatsIcon
			}
		}
		func pageRootViewController() -> UIViewController {
			switch self {
			case .profile:
				return ProfileViewController()
			case .catalog:
				return CatalogViewController()
			case .shoppingCart:
				return ShoppingCartViewController()
			case .statistics:
				return StatisticsViewController()
			}
		}
	}

	enum Appearance {
		static let profileTabTitle = "Профиль"
		static let catalogTabTitle = "Каталог"
		static let shoppingCartTabTitle = "Корзина"
		static let statisticsTabTitle = "Статистика"

		static let tabProfileIcon = UIImage(systemName: "person.crop.circle.fill") ?? UIImage()
		static let tabCatalogIcon = UIImage(systemName: "rectangle.stack.fill") ?? UIImage()
		static let tabShoppingCartIcon = UIImage(systemName: "bag.fill") ?? UIImage()
		static let tabStatsIcon = UIImage(systemName: "flag.2.crossed.fill") ?? UIImage()
	}
}
