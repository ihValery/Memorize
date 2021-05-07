//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    //Тип оболочки свойства, который отражает значение из UserDefaults
//    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            
//            if isOnboarding {
//                OnboardingView()
//            } else {
//                let game = EmojiMemoryGame()
//                EmojiMemoryGameView(viewModelGame: game)
//            }
            
            
            //Не предназначена для тестирования, и поэтому не надо создавать значения “на лету”,
            //Помещаем в отдельную переменную.
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModelGame: game)
        }
    }
}
