//
//  Color.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.05.21.
//

import SwiftUI

extension Color {
    static let lightScheme = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkScheme = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static var colorText: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? .black : .white } )
    }
}
