//
//  BottomPanel.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

struct TopPanelMenu: View {
    
    @ObservedObject var viewModelGame: EmojiMemoryGame
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text("Счет:")
                .fontWeight(.medium)
            Text(viewModelGame.updateScore())
                .fontWeight(.medium)
                .frame(minWidth: 50, alignment: .center)
        }
        .contextMenu(ContextMenu(menuItems: {
            Button("Пересоздать", action: {
                withAnimation(.easeIn.delay(0.5)) {
                    viewModelGame.newGame()
                }
            })
        }))
        .font(.title2)
        
    }
}

struct BottomPanel_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelMenu(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
