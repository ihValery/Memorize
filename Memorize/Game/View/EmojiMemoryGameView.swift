//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
//    @State private var showOnboarding = true
    //“обертка свойства” @ObservedObject говорит что когда переменная objectWillChange
    //этот View себя перерисовывает
    @ObservedObject var viewModelGame: EmojiMemoryGame
    @ObservedObject var theme = ThemeSettings.shared
    
    // Свойство var с именем body и ТИПОМ some View ещё интересна тем, является вычисляемой (computed)
    var body: some View {
        ZStack {
            AnimationForAppear(color: .element)

            VStack {
                TopPanelMenu(viewModelGame: viewModelGame)
                    .padding(.bottom, -4)
                
                if viewModelGame.cards.allSatisfy { $0.isMatched == true } {
                    VictoryView(viewModelGame: viewModelGame, theme: theme)
                    
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
            .foregroundColor(themeData[self.theme.current].color)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let oneCard = EmojiMemoryGame()
        return EmojiMemoryGameView(viewModelGame: oneCard)
        //            .preferredColorScheme(.dark)
    }
}
