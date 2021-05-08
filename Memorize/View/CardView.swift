//
//  CardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

// Структура для одной карты
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            bodyForCard(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func bodyForCard(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                substrateForAnimation()
                Text(card.content)
                    .font(.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    @ViewBuilder
    private func substrateForAnimation() -> some View {
        if themeApp.number <= 8 {
            Star().padding(5).opacity(0.25)
        } else {
            Pie(startAngle: Angle.degrees(270), endAngle: Angle.degrees(25), clockwise: true).padding(5).opacity(0.25)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = EmojiMemoryGame().cards.first!
        CardView(card: card)
    }
}
