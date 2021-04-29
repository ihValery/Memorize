//
//  File.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import Foundation

//Это Generic struct MemoryGame с “Не важно, какой” ТИПом CardContent,
//который представляет собой содержимое карты Card и в нашей эмоджи игре содержимым карты
struct MemoryGame <CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
        
    init(numbersOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for indexPairs in 0..<numbersOfPairsOfCards {
            let content = cardContentFactory(indexPairs)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    //Предсталяет единственную карту
    struct Card {
        
        var isFaceUp: Bool
        var isMatched: Bool
        //Переменная content имеет “Не важно, какой” ТИП, и я назову его CardContent.
        //Это “Не важно, какой” ТИП, и меня просят вверху в угловых скобках < > СООБЩИТЬ МИРУ, что CardContent— это generic ТИП:
        var content: CardContent
    }
}
