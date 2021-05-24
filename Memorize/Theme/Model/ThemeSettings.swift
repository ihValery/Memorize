//
//  ThemeSettings.swift
//  ThemeAplication
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import Foundation

final public class ThemeSettings: ObservableObject {
    @Published var current: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.current, forKey: "Theme")
        }
    }
    
//    static func createTheme(id: Int) -> Theme {
//        var themeIn: Theme
//        themeIn = themeData[id].
//    }
    
    private init() {
//        self.current = UserDefaults.standard.integer(forKey: "Theme")
    }
    public static let shared = ThemeSettings()
}
