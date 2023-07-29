import UIKit

enum Theme {
	// MARK: - Fonts
	enum FontStyle {
		case preferred(style: UIFont.TextStyle)
	}

	static func font(style: FontStyle) -> UIFont {
		let customFont: UIFont

		switch style {
		case let .preferred(style: style):
			customFont = UIFont.preferredFont(forTextStyle: style)
		}
		return customFont
	}
}
