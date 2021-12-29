//
//  GameBoardViewModel.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import SwiftUI

class GameBoardViewModel: ObservableObject {
    //Но я назвал эту переменную model, так что если вы будете просматривать этот код, то подумаете: “О! Этот код обеспечивает доступ к Model.”
    //Когда мы пишем private (set), то это соответствует тому, что ДВЕРЬ ЗАКРЫТА, но это СТЕКЛЯННАЯ ДВЕРЬ
    //только GameBoardViewModel может модифицировать переменную var modelGame, но любой может смотреть на modelGame.
    //private (set) - но, мы хотим, чтобы дверь была закрытой, то есть строгий private
    //В нашем случае Property Wrapper (“обертка свойства”) @Published вызывает objectWillChange.send()
    //каждый раз, когда переменная modelGame изменяется.
    @Published private var modelGame: GameBoard<String> = GameBoardViewModel.createMemoryGame()
    
    static private func createMemoryGame(_ collectionShuffled: [String]? = nil) -> GameBoard<String> {
        
        return GameBoard<String>(numbersOfPairsOfCards: themeData[ThemeViewModel.shared.current].number) { pairIndex in
            if let collectionShuffled = collectionShuffled {
                return collectionShuffled[pairIndex]
            } else {
                return themeData[ThemeViewModel.shared.current].collection[pairIndex]
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
        let collectionShuffled = themeData[ThemeViewModel.shared.current].collection.shuffled()
        
        modelGame = GameBoardViewModel.createMemoryGame(collectionShuffled)
    }
    
    func updateScore() -> String {
        String(modelGame.score)
    }
    
    // Временная проверка анимации
    func endGame() {
        modelGame.endGame()
    }
}
