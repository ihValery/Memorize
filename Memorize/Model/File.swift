//
//  File.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import Foundation

struct MemoryGame <CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
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
