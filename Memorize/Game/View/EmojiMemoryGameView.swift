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
    
    // Свойство var с именем body и ТИПОМ some View ещё интересна тем, является вычисляемой (computed)
    var body: some View {
        ZStack {
            Color.element
                .ignoresSafeArea()
            VStack {
                TopPanelMenu(viewModelGame: viewModelGame)
                    .padding(.bottom, -6)
                
                Grid(viewModelGame.cards) { item in
                    CardView(card: item)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.5)) {
                                viewModelGame.choose(item) }
                        }
                        .padding(4)
                }
            }
            .padding(.horizontal, 3)
            .padding(.bottom, 20)
            .foregroundColor(ThemeFactory.themeApp.color)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let oneCard = EmojiMemoryGame()
//        let theme = ThemeFactory()
        return EmojiMemoryGameView(viewModelGame: oneCard)
//            .preferredColorScheme(.dark)
    }
}