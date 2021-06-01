//
//  Color.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.05.21.
//

import SwiftUI

extension Color {
    static let element = Color("element")
    static let colorText = Color("colorText")
    static var colorTextNewGame: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? .black : .white } )
    }
}

//Цвет темы
extension Color {
    static let blueTheme = Color("blueTheme")
    static let grayTheme = Color("grayTheme")
    static let greenTheme = Color("greenTheme")
    static let indigoTheme = Color("indigoTheme")
    static let orangeTheme = Color("orangeTheme")
    static let pinkTheme = Color("pinkTheme")
    static let redTheme = Color("redTheme")
    static let tealTheme = Color("tealTheme")
    static let yellowTheme = Color("yellowTheme")
}

//Цвет бокового меню
extension Color {
    static let purpleTheme = Color("purpleTheme")
    static let purpleGradientStart = Color("purpleGradientStart")
    static let purpleGradientEnd = Color("purpleGradientEnd")
}

//Цвет Sign
extension Color {
    static let orangeGradientEnd = Color("orangeGradientEnd")
    static let orangeGradientStart = Color("orangeGradientStart")
}

//Цвет onboarding
extension Color {
    static let colorAnimalEnd = Color("colorAnimalEnd")
    static let colorAnimalStart = Color("colorAnimalStart")  
    static let colorChildEnd = Color("colorChildEnd")
    static let colorChildStart = Color("colorChildStart")
    static let colorFlagEnd = Color("colorFlagEnd")
    static let colorFlagStart = Color("colorFlagStart")
    static let colorHalloweenEnd = Color("colorHalloweenEnd")
    static let colorHalloweenStart = Color("colorHalloweenStart")
    static let colorSportEnd = Color("colorSportEnd")
    static let colorSportStart = Color("colorSportStart")
    static let colorZooEnd = Color("colorZooEnd")
    static let colorZooStart = Color("colorZooStart")
}
