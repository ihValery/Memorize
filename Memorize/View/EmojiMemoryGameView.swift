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
            VStack {
                Grid(viewModelGame.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModelGame.choose(card: card)
                        }
                        .padding(5)
                }
                ZStack{
                    HStack {
                        Text("Helloween").onTapGesture {
                            print("Выбрать тему?")
                        }
                        Spacer()
                        Text("Score:  0")
                    }
                    .padding([.leading, .trailing], .some(7))
                    HStack {
                        NewGameButton(newGameAction: viewModelGame)
                    }
                    
                }
            }
            .padding()
            .foregroundColor(.orange)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct NewGameButton: View {
    
    var newGameAction: EmojiMemoryGame
    
    var body: some View {
        Button(" NEW GAME ", action: newGameAction.newGame)
            .font(.title.weight(.light))
            .padding(7)
            .background(Color.orange)
            .cornerRadius(Constants.cornerRadius)
            .foregroundColor(.colorText)
//            .padding(5)
//            .overlay(
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(Color.orange, lineWidth: 3))
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
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius).fill()
                    }
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
//            .preferredColorScheme(.dark)
    }
}
