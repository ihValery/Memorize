//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModelGame: EmojiMemoryGame
    @ObservedObject var theme = ThemeSettings.shared
    
    var body: some View {
        ZStack {
            AnimationForAppear(color: .element)

            VStack {
                TopPanelMenu(viewModelGame: viewModelGame)
                    .padding(.bottom, -4)
                
                if viewModelGame.cards.allSatisfy { $0.isMatched == true } {
                    VictoryView(viewModelGame: viewModelGame, theme: theme, session: SessionFirebase())
                } else {
                    Grid(viewModelGame.cards) { item in
                        CardView(card: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.5)) {
                                    viewModelGame.choose(item)
                                }
                            }
                            .padding(4)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .padding(.horizontal, 3)
            .padding(.bottom, 20)
            .foregroundColor(themeData[theme.current].color)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let oneCard = EmojiMemoryGame()
        return EmojiMemoryGameView(viewModelGame: oneCard)
        //            .preferredColorScheme(.dark)
    }
}
