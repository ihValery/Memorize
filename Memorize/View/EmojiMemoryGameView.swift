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
        VStack {
            Grid(viewModelGame.cards) { card in
                CardView(card: card)
                    .onTapGesture { viewModelGame.choose(card) }
                    .padding(4)
            }
            bottomPanel()
        }
        .padding(3)
        .padding([.bottom], 20)
        .foregroundColor(themeApp.color)
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    private func bottomPanel() -> some View {
        ZStack{
            HStack {
                nameThemePlusContexMenu()
                Spacer()
                Text("Score:")
                Text(viewModelGame.updateScore())
                    .frame(minWidth: 25, alignment: .trailing)
            }
            .padding([.leading, .trailing], .some(7))
            HStack {
                Button(" NEW GAME ", action: viewModelGame.newGame)
                    .font(.title.weight(.light))
                    .padding(7)
                    .background(themeApp.color)
                    .cornerRadius(Constants.cornerRadius)
                    .foregroundColor(.colorText)
            }
        }
    }
    
    private func nameThemePlusContexMenu() -> some View {
        Text(themeApp.name)
            .contextMenu {
                Text("Easy level")
                Button("🧚‍♀️   Children") {
                    themeApp = ThemeFactory.createTheme(type: .child)
                    viewModelGame.newGame()
                }
                Button("🐶   Animal") {
                    themeApp = ThemeFactory.createTheme(type: .animal)
                    viewModelGame.newGame()
                }
                Text("Middle level")
                Button("🦜   Zoo") {
                    themeApp = ThemeFactory.createTheme(type: .zoo)
                    viewModelGame.newGame()
                }
                Button("🧛🏼   Halloween") {
                    themeApp = ThemeFactory.createTheme(type: .halloween)
                    viewModelGame.newGame()
                }
                Button("🏀   Sport (random)") {
                    themeApp = ThemeFactory.createTheme(type: .sport)
                    viewModelGame.newGame()
                }
                Text("Сheck yourself")
                Button("🇺🇦   Flags") {
                    themeApp = ThemeFactory.createTheme(type: .flags)
                    viewModelGame.newGame()
                }
            }
    }
}

// Структура для одной карты
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            bodyForCard(for: geometry.size)
        }
    }
    
    private func bodyForCard(for size: CGSize) -> some View {
        return ZStack {
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
        .font(.system(size: Constants.fontSize(for: size)))
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
