//
//  Constants.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//

import UIKit

var themeApp = ThemeFactory().createTheme(type: .child)

func fontSize(for size: CGSize) -> CGFloat {
    min(size.height, size.width) * 0.7
}
