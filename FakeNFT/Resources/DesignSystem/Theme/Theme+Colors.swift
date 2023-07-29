import UIKit

extension Theme {
	// MARK: - Colors
	private enum FlatColor {
		static let black = UIColor(hex: 0x1A1B22)
		static let white = UIColor(hex: 0xFFFFFF)

		static let lightGrayDay = UIColor(hex: 0xF7F7F8)
		static let lightGrayNight = UIColor(hex: 0x2C2C2E)

		static let gray = UIColor(hex: 0x625C5C)
		static let red = UIColor(hex: 0xF56B6C)
		static let backround = UIColor(hex: 0x1A1B22).withAlphaComponent(0.5)
		static let green = UIColor(hex: 0x1C9F00)
		static let blue = UIColor(hex: 0x0A84FF)
		static let yellow = UIColor(hex: 0xFEEF0D)
	}

	enum Color {
		case main
		case accent
		case background
		case attention
		case white
		case black
		case lightGray
		case gray
		case red
		case green
		case blue
		case allDayWhite
		case allDayBlack
		case yellow
	}

	static func color(usage: Color) -> UIColor {
		let customColor: UIColor

		switch usage {
		case .main:
			customColor = UIColor.color(
				light: FlatColor.black,
				dark: FlatColor.white
			)
		case .accent:
			customColor = FlatColor.blue
		case .background:
			customColor = FlatColor.backround
		case .attention:
			customColor = FlatColor.red

		case .white:
			customColor = UIColor.color(
				light: FlatColor.white,
				dark: FlatColor.black
			)
		case .black:
			customColor = UIColor.color(
				light: FlatColor.black,
				dark: FlatColor.white
			)
		case .lightGray:
			customColor = UIColor.color(
				light: FlatColor.lightGrayDay,
				dark: FlatColor.lightGrayNight
			)

		case .gray:
			customColor = FlatColor.gray
		case .allDayWhite:
			customColor = FlatColor.white
		case .allDayBlack:
			customColor = FlatColor.black
		case .red:
			customColor = FlatColor.red
		case .green:
			customColor = FlatColor.green
		case .blue:
			customColor = FlatColor.blue
		case .yellow:
			customColor = FlatColor.yellow
		}

		return customColor
	}
}
