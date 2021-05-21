//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

@main
struct MemorizeApp: App {

    var body: some Scene {
        WindowGroup {
            //Не предназначена для тестирования, и поэтому не надо создавать значения “на лету”,
            //Помещаем в отдельную переменную.
//            let game = EmojiMemoryGame()
//            EmojiMemoryGameView(viewModelGame: game)
            SideMenuMainView()
//            ThemeViewMain()
        }
    }
}
