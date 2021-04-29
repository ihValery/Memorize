//
//  ContentView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct ContentView: View {
    
    var viewModelGame: EmojiMemoryGame
    // Свойство var с именем body и ТИПОМ some View ещё интересна тем, является вычисляемой (computed)
    var body: some View {
        HStack {
            ForEach(viewModelGame.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModelGame.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        // функция font воздействует ТОЛЬКО на ВСЕ Text, входящие в стек ZStack.
        .font(.largeTitle)
    }
}

// Структура для одной карты
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 13.0)
                    // Есть необязательный аргумент и этим аргументом является цвет Color
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 13.0)
                    // Могут быть другие аргументы, и один из них — ширина линии обводки lineWdth.
                    .stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 13.0).fill()
            }
        }
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
