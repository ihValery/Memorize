////
////  ThemeFactory.swift
////  Memorize
////
////  Created by Валерий Игнатьев on 19.05.21.
////
//
//import SwiftUI
//import Combine
//
//enum ThemeType {
//    case child, animal, zoo, halloween, sport, flags
//}
//
//class ThemeFactory: ObservableObject {
//    static var themeAppNew: Theme = ThemeFactory.createTheme(type: )
//    
//    static func createTheme(type: ThemeType) -> Theme {
//        var theme: Theme
//        
//        switch type {
//            case .child: theme = themeData[0]
//            case .animal: theme = themeData[1]
//            case .zoo: theme = themeData[2]
//            case .halloween: theme = themeData[3]
//            case .sport: theme = themeData[4]
//            case .flags: theme = themeData[5]
//        }
//        return theme
//    }
//}
//
////var themeApp = ThemeFactory().createTheme(type: .zoo)
