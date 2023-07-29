import UIKit

extension UIView {

	var forcedSuperview: UIView { superview! } // swiftlint:disable:this force_unwrapping

	private func height(constant: CGFloat) -> NSLayoutConstraint {
		NSLayoutConstraint(
			item: self,
			attribute: .height,
			relatedBy: .equal,
			toItem: nil,
			attribute: .height,
			multiplier: 1,
			constant: constant
		)
	}

	private func width(constant: CGFloat) -> NSLayoutConstraint {
		NSLayoutConstraint(
			item: self,
			attribute: .width,
			relatedBy: .equal,
			toItem: nil,
			attribute: .width,
			multiplier: 1,
			constant: constant
		)
	}

	func size(_ size: CGSize) -> [NSLayoutConstraint] {
		[
			height(constant: size.height),
			width(constant: size.width)
		]
	}

	func makeConstraints(_ closure: (_ view: UIView) -> [NSLayoutConstraint]) {
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(closure(self))
	}

	func makeEqualToSuperviewCenter(insets: UIEdgeInsets = .zero) {
		assert(superview != nil)
		makeConstraints { make in
			[
				make.centerXAnchor.constraint(equalTo: forcedSuperview.centerXAnchor, constant: insets.left),
				make.centerYAnchor.constraint(equalTo: forcedSuperview.centerYAnchor, constant: insets.top)
			]
		}
	}

	func makeEqualToSuperviewCenterToSafeArea(insets: UIEdgeInsets = .zero) {
		assert(superview != nil)
		makeConstraints { make in
			[
				make.centerXAnchor.constraint(equalTo: forcedSuperview.safeAreaLayoutGuide.centerXAnchor, constant: insets.left),
				make.centerYAnchor.constraint(equalTo: forcedSuperview.safeAreaLayoutGuide.centerYAnchor, constant: insets.top)
			]
		}
	}

	func makeEqualToSuperview(insets: UIEdgeInsets = .zero) {
		assert(superview != nil)
		makeConstraints { make in
			[
				make.topAnchor.constraint(equalTo: forcedSuperview.topAnchor, constant: insets.top),
				make.leftAnchor.constraint(equalTo: forcedSuperview.leftAnchor, constant: insets.left),
				make.rightAnchor.constraint(equalTo: forcedSuperview.rightAnchor, constant: -insets.right),
				make.bottomAnchor.constraint(equalTo: forcedSuperview.bottomAnchor, constant: -insets.bottom)
			]
		}
	}

	func makeEqualToSuperviewToSafeArea(insets: UIEdgeInsets = .zero) {
		assert(superview != nil)
		makeConstraints { make in
			[
				make.topAnchor.constraint(equalTo: forcedSuperview.safeAreaLayoutGuide.topAnchor, constant: insets.top),
				make.leftAnchor.constraint(equalTo: forcedSuperview.safeAreaLayoutGuide.leftAnchor, constant: insets.left),
				make.rightAnchor.constraint(equalTo: forcedSuperview.safeAreaLayoutGuide.rightAnchor, constant: -insets.right),
				make.bottomAnchor.constraint(equalTo: forcedSuperview.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
			]
		}
	}
}

extension UIEdgeInsets {
	init(all: CGFloat) {
		self.init(top: all, left: all, bottom: all, right: all)
	}

	init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
		self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
	}

	init(bottom: CGFloat) {
		self.init(top: 0, left: 0, bottom: bottom, right: 0)
	}

	init(top: CGFloat) {
		self.init(top: top, left: 0, bottom: 0, right: 0)
	}
}
