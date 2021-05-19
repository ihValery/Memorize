//
//  Theme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 4.05.21.
//

import SwiftUI

protocol Theme {
    var name: String { get }
    var color: Color { get }
    var collection: [String] { get }
    var number: Int { get }
    var avatar: String { get }
    var level: CGFloat { get }
}

class Children: Theme {
    private (set) var name = "Child"
    private (set) var color = Color.yellowTheme
    private (set) var collection = ["👸", "🧞", "🧜‍♀️", "🧚‍♀️", "🦄", "🦋", "🐠", "🐬"].shuffled()
    private (set) var number = 4
    private (set) var avatar = "🧚‍♀️"
    private (set) var level: CGFloat = 0.1
}

class Animals: Theme {
    private (set) var name = "Animals"
    private (set) var color = Color.indigoTheme
    private (set) var collection = ["🐨", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼",
                                    "🐷", "🐯", "🦁", "🐮", "🐸", "🐵"].shuffled()
    private (set) var number = 6
    private (set) var avatar = "🐶"
    private (set) var level: CGFloat = 0.2
}

class Zoo: Theme {
    private (set) var name = "Zoo"
    private (set) var color = Color.tealTheme
    private (set) var collection = ["🐢", "🐍", "🦎", "🦑", "🦞", "🐡", "🐳", "🐅", "🐆", "🐫",
                                    "🦏", "🐘", "🦧", "🦒", "🦘", "🐄", "🐎", "🦌", "🐏", "🐈",
                                    "🐩", "🦃", "🕊", "🦩", "🦫", "🐿", "🦨"].shuffled()
    private (set) var number = 9
    private (set) var avatar = "🐘"
    private (set) var level: CGFloat = 0.3
}

class Halloween: Theme {
    private (set) var name = "Halloween"
    private (set) var color = Color.orangeTheme
    private (set) var collection = ["👻", "🩸", "🕷", "☠️", "🕸", "⚰️", "🧟‍♂️", "🧛🏼", "🎃", "💀", "🦇"].shuffled()
    private (set) var number = 9
    private (set) var avatar = "🦇"
    private (set) var level: CGFloat = 0.5
}

class Sport: Theme {
    private (set) var name = "Sport"
    private (set) var color = Color.greenTheme
    private (set) var collection = ["⛸", "🏀", "⚽️", "🥊", "🎯", "🏈", "🏓", "🎳", "🏒", "♟",
                                    "🥏", "🪃", "🥅", "🏸", "🛹", "🥋", "🏐", "🏏", "⚾️", "🎱"].shuffled()
    var number: Int {
        let random = [9, 12, 14, 16, 20].randomElement()!
        return random
    }
    private (set) var avatar = "🏓"
    private (set) var level: CGFloat = 0.7
}

class Flags: Theme {
    private (set) var name = "Flags"
    private (set) var color = Color.blueTheme
    private (set) var collection = ["🇦🇺", "🇧🇷", "🇧🇾", "🇬🇧", "🇰🇷", "🇺🇦", "🇯🇵", "🇯🇲", "🇸🇪", "🇨🇦",
                                    "🇿🇦", "🇧🇪", "🇪🇪", "🇨🇿", "🇫🇷", "🇫🇮", "🇹🇷", "🇸🇱", "🇷🇴", "🇷🇺",
                                    "🇳🇴", "🇲🇱", "🇨🇬", "🇨🇾", "🇮🇹", "🇦🇹", "🇧🇸", "🇩🇰", "🇮🇩", "🇰🇿",
                                    "🇦🇱", "🇧🇯", "🇧🇶", "🇧🇦", "🇧🇬", "🇻🇳", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇪", "🇲🇬", "🇱🇺"].shuffled()
    private (set) var number = 36
    private (set) var avatar = "🇫🇮"
    private (set) var level: CGFloat = 1.0
}
