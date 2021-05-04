//
//  File.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import Foundation

//Это Generic struct MemoryGame с “Не важно, какой” ТИПом CardContent,
//который представляет собой содержимое карты Card и в нашей эмоджи игре содержимым карты
struct MemoryGame <CardContent> where CardContent: Equatable {
    
    var cards: [Card]
    
    private var sawThisCard: [Int] = []
    var score = 0
    
    private var indexOnlyOneFaceUpCard: Int? {
        //Смотрим на все карты и и проверяем если одна единственная карточка
        get { cards.indices.filter { cards[$0].isFaceUp }.onlyOne }
        set {
            for index in cards.indices {
                //Переворачиваем все карти лицом вниз кроме одной с индексом newValue
                cards[index].isFaceUp = index == newValue
           }
        }
    }
    
    //Инициализатор который заполняет массив карточек
    init(numbersOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for indexPairs in 0..<numbersOfPairsOfCards {
            let content = cardContentFactory(indexPairs)
            cards.append(Card(id: indexPairs * 2, content: content))
            cards.append(Card(id: indexPairs * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    ///Функционал когда мы выбираем карточку
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(selected: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched else { return }

        if let potentialMatchIndex = indexOnlyOneFaceUpCard {

            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score += 2
            } else {
                scoring(chosenIndex, potentialMatchIndex)
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            indexOnlyOneFaceUpCard = chosenIndex
        }
    }

    ///Формирование счета в игре: -1 очко за каждое несовпадение ранее увиденной карты.
    mutating func scoring(_ chosenIndex: Int, _ potentialMatchIndex: Int) {
        sawThisCard.contains(cards[chosenIndex].id) ? score -= 1 : sawThisCard.append(cards[chosenIndex].id)
        sawThisCard.contains(cards[potentialMatchIndex].id) ? score -= 1 :  sawThisCard.append(cards[potentialMatchIndex].id)
    }
    
    //Предсталяет единственную карту
    struct Card: Identifiable {
        
        //Заменить id на что-то самостоятельное
        var id: Int
        var isFaceUp = false
        var isMatched = false
        //Переменная content имеет “Не важно, какой” ТИП, и я назову его CardContent.
        //Это “Не важно, какой” ТИП, и меня просят вверху в угловых скобках < > СООБЩИТЬ МИРУ, что CardContent— это generic ТИП:
        var content: CardContent
    }
}
