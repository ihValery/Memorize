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
        //        ZStack{
        HStack(alignment: .center) {
//                            ContextMenu(viewModelGame: viewModelGame)
//                                .padding(.leading, 50)
//                            Spacer()
            Text("Счет:")
                .fontWeight(.medium)
            Text(viewModelGame.updateScore())
                .fontWeight(.medium)
                .frame(minWidth: 50, alignment: .center)
        }
        .font(.title2)
        //            .multilineTextAlignment(.center)
        //            .padding([.leading, .trailing], 7)
        //            HStack {
        //                Button(" new ", action: viewModelGame.newGame)
        //                    .font(.title.weight(.light))
        ////                    .background(themeApp.color)
        //                    .cornerRadius(13)
        //                    .foregroundColor(.colorTextNewGame)
        //            }
        //        }
    }
}

struct BottomPanel_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelMenu(viewModelGame: EmojiMemoryGame())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
