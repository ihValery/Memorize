//
//  BottomPanel.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

struct BottomPanel: View {
    
    @ObservedObject var viewModelGame: EmojiMemoryGame
    
    var body: some View {
        ZStack{
            HStack {
                ContextMenu(viewModelGame: viewModelGame)
                    .padding(.leading, 50)
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
                    .cornerRadius(13)
                    .foregroundColor(.colorText)
            }
        }
    }
}

struct BottomPanel_Previews: PreviewProvider {
    static var previews: some View {
        BottomPanel(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
