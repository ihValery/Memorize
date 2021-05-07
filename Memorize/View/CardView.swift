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
    
    private func bodyForCard(for size: CGSize) -> some View {
        return ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 13).fill(Color.white)
                RoundedRectangle(cornerRadius: 13).stroke(lineWidth: 3)
                
                substrateForAnimation()
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: 13).fill()
                }
            }
        }
        .font(.system(size: fontSize(for: size)))
    }
    
    @ViewBuilder private func substrateForAnimation() -> some View {
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
