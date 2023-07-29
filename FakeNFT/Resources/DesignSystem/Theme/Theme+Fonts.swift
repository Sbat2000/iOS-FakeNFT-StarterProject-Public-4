import UIKit

enum Theme {
	// MARK: - Fonts
	enum FontStyle {
		case preferred(style: UIFont.TextStyle)
		case largeTitle // bold34
		case title1 // bold32
		case title2 // bold22
		case headline // bold17
		case body // regular17
		case subhead // regular15
		case footnote // regular13
		case caption // medium10
	}

	static func font(style: FontStyle) -> UIFont {
		let customFont: UIFont

		switch style {
		case let .preferred(style: style):
			customFont = UIFont.preferredFont(forTextStyle: style)
		case .largeTitle:
			customFont = .boldSystemFont(ofSize: 34)
		case .title1:
			customFont = .boldSystemFont(ofSize: 32)
		case .title2:
			customFont = .boldSystemFont(ofSize: 22)
		case .headline:
			customFont = .boldSystemFont(ofSize: 17)
		case .body:
			customFont = .systemFont(ofSize: 17, weight: .regular)
		case .subhead:
			customFont = .systemFont(ofSize: 15, weight: .regular)
		case .footnote:
			customFont = .systemFont(ofSize: 13, weight: .regular)
		case .caption:
			customFont = .systemFont(ofSize: 10, weight: .medium)
		}
		return customFont
	}
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewProvider: PreviewProvider {
	static func makeLabel(customFont: Theme.FontStyle, text: String) -> UILabel {
		let label = UILabel()
		label.font = Theme.font(style: customFont)
		label.text = text

		return label
	}

	static var previews: some View {
		let largeTitle = makeLabel(customFont: .largeTitle, text: "Welcome")
		let title1 = makeLabel(customFont: .title1, text: "Welcome")
		let title2 = makeLabel(customFont: .title2, text: "Welcome")
		let headline = makeLabel(customFont: .headline, text: "Welcome")
		let body = makeLabel(customFont: .body, text: "Welcome")
		let subhead = makeLabel(customFont: .subhead, text: "Welcome")
		let footnote = makeLabel(customFont: .footnote, text: "Welcome")
		let caption = makeLabel(customFont: .caption, text: "Welcome")

		return Group {
			VStack(spacing: 0) {
				(largeTitle as UIView).preview().frame(height: 40)
				(title1 as UIView).preview().frame(height: 40)
				(title2 as UIView).preview().frame(height: 40)
				(headline as UIView).preview().frame(height: 40)
				(body as UIView).preview().frame(height: 40)
				(subhead as UIView).preview().frame(height: 40)
				(footnote as UIView).preview().frame(height: 40)
				(caption as UIView).preview().frame(height: 40)
			}
		}
	}
}
#endif
