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
    @Binding var startDeal: Bool
    
    var body: some View {
        VStack {
//            Text("Победитель!")
//                .fontWeight(.semibold)
//                .padding()
            
            GradientTrophy()
            
            Button(action: {
                withAnimation {
                    startDeal.toggle()
                    viewModelGame.newGame()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    startDeal.toggle()
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
        VictoryView(viewModelGame: EmojiMemoryGame(), startDeal: .constant(true))
    }
}
