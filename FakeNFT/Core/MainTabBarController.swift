import UIKit

final class MainTabBarController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .red

		let label = UILabel()
		label.text = "Not implemented"
		label.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(label)

		NSLayoutConstraint.activate([
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}
