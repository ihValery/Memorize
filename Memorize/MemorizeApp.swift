//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView(showMenu: .constant(false), selectTab: .constant("Помощь"))
            } else {
                SideMenuMainView()                
            }
        }
    }
}
