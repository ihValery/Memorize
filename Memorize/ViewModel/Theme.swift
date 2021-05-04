//
//  Theme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 4.05.21.
//

import SwiftUI

enum ThemeType {
    case child
    case animal
    case zoo
    case halloween
    case sport
    case flags
}

protocol Theme {
    var name: String { get }
    var color: Color { get }
    var collection: [String] { get }
    var numberLevel: Int { get }
}

class Children: Theme {
    var name = "Child"
    var color = Color(UIColor.systemYellow)
    var collection = ["👸", "🧞", "🧜‍♀️", "🧚‍♀️", "👼", "🦄", "🦋", "🐠", "🐬", "🧝‍♀️", "🧙"].shuffled()
    var numberLevel = 6
}

class Animals: Theme {
    var name = "Animals"
    var color = Color(UIColor.systemIndigo)
    var collection = ["🐨", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️",
                      "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵"].shuffled()
    var numberLevel = 6
}

class Zoo: Theme {
    var name = "Zoo"
    var color = Color(UIColor.systemTeal)
    var collection = ["🐢", "🐍", "🦎", "🦑", "🦞", "🐡", "🐳", "🐅", "🐆", "🐫",
                      "🦏", "🐘", "🦧", "🦒", "🦘", "🐄", "🐎", "🦌", "🐏", "🐈",
                      "🐩", "🦃", "🕊", "🦩", "🦫", "🐿", "🦨"].shuffled()
    var numberLevel = 9
}

class Halloween: Theme {
    var name = "Halloween"
    var color = Color(UIColor.systemOrange)
    var collection = ["👻", "🎃", "🕷", "🕸", "⚰️", "💀", "🧟‍♂️", "🧛🏼", "🩸", "☠️", "🦇"].shuffled()
    var numberLevel = 9
}

class Sport: Theme {
    
    var name = "Sport"
    var color = Color(UIColor.systemGreen)
    var collection = ["⛸", "🏀", "⚽️", "🥊", "🎯", "🏈", "🏓", "🎳", "🏒", "♟",
                      "🥏", "🪃", "🥅", "🏸", "🛹", "🥋", "🏐", "🏏", "⚾️", "🎱"].shuffled()
    var numberLevel = Int.random(in: 9...20)
}

class Flags: Theme {
    
    var name = "Flags"
    var color = Color(UIColor.systemBlue)
    var collection = ["🇦🇺", "🇧🇷", "🇧🇾", "🇬🇧", "🇰🇷", "🇺🇦", "🇯🇵", "🇯🇲", "🇸🇪", "🇨🇦",
                      "🇿🇦", "🇧🇪", "🇪🇪", "🇨🇿", "🇫🇷", "🇫🇮", "🇹🇷", "🇸🇱", "🇷🇴", "🇷🇺",
                      "🇳🇴", "🇲🇱", "🇨🇬", "🇨🇾", "🇮🇹", "🇦🇹", "🇧🇸", "🇩🇰", "🇮🇩", "🇰🇿",
                      "🇦🇱", "🇧🇯", "🇧🇶", "🇧🇦", "🇧🇬", "🇻🇳", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇪", "🇲🇬", "🇱🇺"].shuffled()
    var numberLevel = 36
}

class ThemeFactory {
        
    static func createTheme(type: ThemeType) -> Theme {
        var theme: Theme
        
        switch type {
            case .child: theme = Children()
            case .animal: theme = Animals()
            case .zoo: theme = Zoo()
            case .halloween: theme = Halloween()
            case .sport: theme = Sport()
            case .flags: theme = Flags()
        }
        return theme
    }
}

var themeApp = ThemeFactory.createTheme(type: .halloween)
