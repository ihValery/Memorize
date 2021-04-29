//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import SwiftUI

class EmojiMemoryGame {
    
    //Но я назвал эту переменную model, так что если вы будете просматривать этот код, то подумаете: “О! Этот код обеспечивает доступ к Model.”
    //Когда мы пишем private (set), то это соответствует тому, что ДВЕРЬ ЗАКРЫТА, но это СТЕКЛЯННАЯ ДВЕРЬ
    //только EmojiMemoryGame может модифицировать переменную var modelGame, но любой может смотреть на modelGame.
    //private (set) - но, мы хотим, чтобы дверь была закрытой, то есть строгий private
    private var modelGame: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String] = ["👻", "🎃"]
        return MemoryGame<String>(numbersOfPairsOfCards: 2) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    //MARK: - Assess to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        modelGame.cards
    }

    //MARK: - Intent(s) Намерения позволяющие изменить model.

    
    func choose(card: MemoryGame<String>.Card) {
        modelGame.choose(card: card)
    }

}
