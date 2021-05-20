//
//  ThemeSettings.swift
//  ThemeAplication
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import Foundation

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
}
