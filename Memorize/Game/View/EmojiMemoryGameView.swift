//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    //“обертка свойства” @ObservedObject говорит что когда переменная objectWillChange
    //этот View себя перерисовывает
    @ObservedObject var viewModelGame: EmojiMemoryGame
    @ObservedObject var theme = ThemeSettings.shared
    
    @State var startDeal: Bool = false
    
    // Свойство var с именем body и ТИПОМ some View ещё интересна тем, является вычисляемой (computed)
    var body: some View {
        ZStack {
            Color.element
                .ignoresSafeArea()
            VStack {
                TopPanelMenu(viewModelGame: viewModelGame)
                    .padding(.bottom, -4)
                
                if viewModelGame.cards.allSatisfy({ $0.isMatched == true }) {
                    VictoryView(viewModelGame: viewModelGame, theme: theme, startDeal: $startDeal)
                    
                } else {
                    Grid(viewModelGame.cards) { item in
                        CardView(card: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.5)) {
                                    viewModelGame.choose(item) }
                            }
                            .animation(startDeal ? .easeInOut(duration: 0.7).delay(delayForStartDeal(index: item)) : .default)
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
    
    private func delayForStartDeal(index: MemoryGame<String>.Card) -> Double {
        return Double(viewModelGame.cards.firstChosenIndex(selected: index)!) * 0.2
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let oneCard = EmojiMemoryGame()
        return EmojiMemoryGameView(viewModelGame: oneCard)
        //            .preferredColorScheme(.dark)
    }
}
