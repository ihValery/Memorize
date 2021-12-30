//
//  ColorExtension.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.05.21.
//

import SwiftUI

extension Color {
    static let element = Color("element")
    static let colorText = Color("colorText")
    //Способ без Assets
    static var colorTextNewGame: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? .black : .white } )
    }
}

extension Color {
    static let themeCartoons = Color("themeCartoons")
    static let blueTheme = Color("blueTheme")
    static let grayTheme = Color("grayTheme")
    static let greenTheme = Color("greenTheme")
    static let indigoTheme = Color("indigoTheme")
    static let orangeTheme = Color("orangeTheme")
    static let pinkTheme = Color("pinkTheme")
    static let redTheme = Color("redTheme")
    static let tealTheme = Color("tealTheme")
    
    static let sideMenuStart = Color("sideMenuStart")
    
    static let signStart = Color("signStart")
    static let signEnd = Color("signEnd")
    
    static let onboardAnimalStart = Color("onboardAnimalStart")
    static let onboardAnimalEnd = Color("onboardAnimalEnd")
    static let onboardChildStart = Color("onboardChildStart")
    static let onboardChildEnd = Color("onboardChildEnd")
    static let onboardFlagStart = Color("onboardFlagStart")
    static let onboardFlagEnd = Color("onboardFlagEnd")
    static let onboardHalloweenStart = Color("onboardHalloweenStart")
    static let onboardHalloweenEnd = Color("onboardHalloweenEnd")
    static let onboardSportStart = Color("onboardSportStart")
    static let onboardSportEnd = Color("onboardSportEnd")
}
