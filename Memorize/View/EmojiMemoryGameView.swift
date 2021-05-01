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
        HStack {
            ForEach(viewModelGame.cards) { card in
                CardView(card: card)
                    //Заставьте карты иметь соотношение между шириной и высотой как 2/3
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .onTapGesture {
                    viewModelGame.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

// Структура для одной карты
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        // Есть необязательный аргумент и этим аргументом является цвет Color
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        // Могут быть другие аргументы, и один из них — ширина линии обводки lineWdth.
                        .stroke(lineWidth: Constants.edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius).fill()
                }
            }
            .font(.system(size: Constants.fontSize(for: geometry.size)))
        }
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
