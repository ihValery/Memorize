//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //Но я назвал эту переменную model, так что если вы будете просматривать этот код, то подумаете: “О! Этот код обеспечивает доступ к Model.”
    //Когда мы пишем private (set), то это соответствует тому, что ДВЕРЬ ЗАКРЫТА, но это СТЕКЛЯННАЯ ДВЕРЬ
    //только EmojiMemoryGame может модифицировать переменную var modelGame, но любой может смотреть на modelGame.
    //private (set) - но, мы хотим, чтобы дверь была закрытой, то есть строгий private
    //В нашем случае Property Wrapper (“обертка свойства”) @Published вызывает objectWillChange.send()
    //каждый раз, когда переменная modelGame изменяется.
    @Published private var modelGame: GameBoard<String> = EmojiMemoryGame.createMemoryGame()
    
    static private func createMemoryGame(_ collectionShuffled: [String]? = nil) -> GameBoard<String> {
        
        return GameBoard<String>(numbersOfPairsOfCards: themeData[ThemeSettings.shared.current].number) { pairIndex in
            if let collectionShuffled = collectionShuffled {
                return collectionShuffled[pairIndex]
            } else {
                return themeData[ThemeSettings.shared.current].collection[pairIndex]
            }
        }
    }
    
    /// Assess to the Model
    var cards: Array<GameBoard<String>.Card> {
        modelGame.cards
    }
    
    func choose(_ card: GameBoard<String>.Card) {
        modelGame.choose(card)
    }
    
    func newGame() {
        let collectionShuffled = themeData[ThemeSettings.shared.current].collection.shuffled()
        
        modelGame = EmojiMemoryGame.createMemoryGame(collectionShuffled)
    }
    
    func updateScore() -> String {
        String(modelGame.score)
    }
    
    // Временная проверка анимации
    func endGame() {
        modelGame.endGame()
    }
}
