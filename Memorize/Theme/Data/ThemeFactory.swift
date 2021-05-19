//
//  ThemeFactory.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import Foundation

enum ThemeType {
    case child, animal, zoo, halloween, sport, flags
}

class ThemeFactory {
    
    func createTheme(type: ThemeType) -> Theme {
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

var themeApp = ThemeFactory().createTheme(type: .zoo)
