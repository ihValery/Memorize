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

    private init() {}
    public static let shared = ThemeSettings()
}
