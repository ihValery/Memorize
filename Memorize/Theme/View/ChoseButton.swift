//
//  ChoseButton.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct ChoseButton: View {
    @Binding var rotateCard: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                rotateCard.toggle()
            }
        }) {
            Text("Выбрать")
                .font(.callout)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(Capsule().stroke(Color.white, lineWidth: 2))
        }
    }
}

struct ChoseButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoseButton(rotateCard: .constant(true))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
