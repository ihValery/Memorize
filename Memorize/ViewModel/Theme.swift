//
//  Theme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 4.05.21.
//

import SwiftUI

enum ThemeType {
    case halloween
    case flags
    case sport
}

protocol Theme {
    var name: String { get }
    var color: Color { get }
    var collection: [String] { get }
    var numberLevel: Int { get }
}

class Halloween: Theme {
    var name = "Halloween"
    var color = Color(UIColor.systemOrange)
    var collection = ["👻", "🎃", "🕷", "🕸", "⚰️", "💀", "🧟‍♂️", "🧛🏼", "🩸", "☠️"].shuffled()
    var numberLevel = 9
}

class Flags: Theme {
    
    var name = "Flags"
    var color = Color(UIColor.systemBlue)
    var collection = ["🇦🇺", "🇧🇷", "🇧🇾", "🇬🇧", "🇰🇷", "🇺🇦", "🇯🇵", "🇯🇲", "🇸🇪", "🇨🇦",
                      "🇿🇦", "🇧🇪", "🇪🇪", "🇨🇿", "🇫🇷", "🇫🇮", "🇹🇷", "🇸🇱", "🇷🇴", "🇷🇺",
                      "🇳🇴", "🇲🇱", "🇨🇬", "🇨🇾", "🇮🇹", "🇦🇹", "🇧🇸", "🇩🇰", "🇮🇩", "🇰🇿"].shuffled()
    var numberLevel = 20
}

class Sport: Theme {
    
    var name = "Sport"
    var color = Color(UIColor.systemGreen)
    var collection = ["⛸", "🏀", "⚽️", "🥊", "🎯", "🏈", "🏓", "🎳", "🏒", "♟",
                      "🥏", "🪃", "🥅", "🏸", "🛹", "🏂", "🏐", "🏏", "⚾️", "🎱"].shuffled()
    var numberLevel = 14
}

class ThemeFactory {
        
    static func createTheme(type: ThemeType) -> Theme {
        var theme: Theme
        
        switch type {
            case .halloween: theme = Halloween()
            case .flags: theme = Flags()
            case .sport: theme = Sport()
        }
        return theme
    }
}

var themeApp = ThemeFactory.createTheme(type: .halloween)
