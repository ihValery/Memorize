//
//  Theme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 4.05.21.
//

import SwiftUI

enum ThemeType {
    case child, animal, zoo, halloween, sport, flags
}

protocol Theme {
    var name: String { get }
    var color: Color { get }
    var collection: [String] { get }
    var number: Int { get }
}

class Children: Theme {
    private (set) var name = "Child"
    private (set) var color = Color(UIColor.systemYellow)
    private (set) var collection = ["👸", "🧞", "🧜‍♀️", "🧚‍♀️", "🦄", "🦋", "🐠", "🐬"].shuffled()
    private (set) var number = 4
}

class Animals: Theme {
    private (set) var name = "Animals"
    private (set) var color = Color(UIColor.systemIndigo)
    private (set) var collection = ["🐨", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼",
                                    "🐷", "🐯", "🦁", "🐮", "🐸", "🐵"].shuffled()
    private (set) var number = 6
}

class Zoo: Theme {
    private (set) var name = "Zoo"
    private (set) var color = Color(UIColor.systemTeal)
    private (set) var collection = ["🐢", "🐍", "🦎", "🦑", "🦞", "🐡", "🐳", "🐅", "🐆", "🐫",
                                    "🦏", "🐘", "🦧", "🦒", "🦘", "🐄", "🐎", "🦌", "🐏", "🐈",
                                    "🐩", "🦃", "🕊", "🦩", "🦫", "🐿", "🦨"].shuffled()
    private (set) var number = 9
}

class Halloween: Theme {
    private (set) var name = "Halloween"
    private (set) var color = Color(UIColor.systemOrange)
    private (set) var collection = ["👻", "🎃", "🕷", "🕸", "⚰️", "💀", "🧟‍♂️", "🧛🏼", "🩸", "☠️", "🦇"].shuffled()
    private (set) var number = 9
}

class Sport: Theme {
    private (set) var name = "Sport"
    private (set) var color = Color(UIColor.systemGreen)
    private (set) var collection = ["⛸", "🏀", "⚽️", "🥊", "🎯", "🏈", "🏓", "🎳", "🏒", "♟",
                                    "🥏", "🪃", "🥅", "🏸", "🛹", "🥋", "🏐", "🏏", "⚾️", "🎱"].shuffled()
    var number: Int {
        let random = [9, 12, 14, 16, 20].randomElement()!
        return random
    }
}

class Flags: Theme {
    private (set) var name = "Flags"
    private (set) var color = Color(UIColor.systemBlue)
    private (set) var collection = ["🇦🇺", "🇧🇷", "🇧🇾", "🇬🇧", "🇰🇷", "🇺🇦", "🇯🇵", "🇯🇲", "🇸🇪", "🇨🇦",
                                    "🇿🇦", "🇧🇪", "🇪🇪", "🇨🇿", "🇫🇷", "🇫🇮", "🇹🇷", "🇸🇱", "🇷🇴", "🇷🇺",
                                    "🇳🇴", "🇲🇱", "🇨🇬", "🇨🇾", "🇮🇹", "🇦🇹", "🇧🇸", "🇩🇰", "🇮🇩", "🇰🇿",
                                    "🇦🇱", "🇧🇯", "🇧🇶", "🇧🇦", "🇧🇬", "🇻🇳", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇪", "🇲🇬", "🇱🇺"].shuffled()
    private (set) var number = 36
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

var themeApp = ThemeFactory.createTheme(type: .animal)
