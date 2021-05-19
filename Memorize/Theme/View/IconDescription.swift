//
//  IconInDescription.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct IconInDescription: View {
    var data: ThemeData
    var iconName: String
    @Binding var rotateCard: Bool
    
    var body: some View {
        Image(iconName)
            .resizable()
            .frame(width: 25, height: 25)
//            .foregroundColor(.colorTextNewGame)
            .padding()
            .background(
                ZStack {
                    data.color
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: data.level)
                        .stroke(Color.white, lineWidth: 5)
                }
                .rotationEffect(.degrees(rotateCard == true ? -90 : 270))
            )
            .clipShape(Circle())
    }
}

struct iconInDescription_Previews: PreviewProvider {
    static var previews: some View {
        IconInDescription(data: dataTheme.first!, iconName: "baby.feet", rotateCard: .constant(true))
            .preferredColorScheme(.dark)
//            .previewLayout(.sizeThatFits)
    }
}
