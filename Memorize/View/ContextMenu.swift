//
//  ContextMenu.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

struct ContextMenu: View {
    
    @ObservedObject
    var viewModelGame: EmojiMemoryGame
    
    var body: some View {
        Text(themeApp.name)
            .contextMenu {
                Text("Easy level")
                Button("🧚‍♀️   Children") {
                    themeApp = ThemeFactory().createTheme(type: .child)
                    viewModelGame.newGame()
                }
                Button("🐶   Animal") {
                    themeApp = ThemeFactory().createTheme(type: .animal)
                    viewModelGame.newGame()
                }
                Text("Middle level")
                Button("🦜   Zoo") {
                    themeApp = ThemeFactory().createTheme(type: .zoo)
                    viewModelGame.newGame()
                }
                Button("🧛🏼   Halloween") {
                    themeApp = ThemeFactory().createTheme(type: .halloween)
                    viewModelGame.newGame()
                }
                Button("🏀   Sport (random)") {
                    themeApp = ThemeFactory().createTheme(type: .sport)
                    viewModelGame.newGame()
                }
                Text("Сheck yourself")
                Button("🇺🇦   Flags") {
                    themeApp = ThemeFactory().createTheme(type: .flags)
                    viewModelGame.newGame()
                }
            }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
