//
//  VictoryView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 22.05.21.
//

import SwiftUI

struct VictoryView: View {
    @ObservedObject var viewModelGame: EmojiMemoryGame
    @ObservedObject var theme = ThemeSettings.shared
    
    var body: some View {
        VStack {
            Text("Ты победил!")
                .fontWeight(.semibold)
                .padding()
            
            Text("🏆")
                .font(.system(size: 250))
            
            Button(action: {
                withAnimation {
                    viewModelGame.newGame()
                }
            }) {
                Text("Новая игра")
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .contentShape(Rectangle())
            }
            .padding(13)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(themeData[self.theme.current].color.opacity(0.9), lineWidth: 3))
            .padding()
        }
        .font(.title.weight(.light))
        .foregroundColor(themeData[self.theme.current].color)
        .padding()
        .transition(.animationForAlarm)
    }
}

struct ButtonNewGameVictory_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView(viewModelGame: EmojiMemoryGame())
    }
}
