//
//  Cardify.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 8.05.21.
//

import SwiftUI

//Прекрасная повторно используемая (reusable) вещь, которую мы могли бы использовать в другой игре.
struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    ///.cardify — это “картафикатор” общего назначения, это ViewModifier, чтобы модифицировать любой View.
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 13).fill(Color.white)
                RoundedRectangle(cornerRadius: 13).stroke(lineWidth: 3)
                content
            } else {
                RoundedRectangle(cornerRadius: 13).fill()
            }
        }
    }
}

extension View {
    ///Модификатор, который делает “картой” любой View. Красивый синтаксис.
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
