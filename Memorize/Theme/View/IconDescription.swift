//
//  IconInDescription.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct IconInDescription: View {
    var iconName: String
    var levelTrim: CGFloat
    
    var body: some View {
        Image(iconName)
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.colorTextNewGame)
            .padding()
            .background(
                ZStack {
                    themeApp.color
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: levelTrim)
                        .stroke(Color.white, lineWidth: 5)
                }
                .rotationEffect(.degrees(-90))
            )
            .clipShape(Circle())
    }
}

struct iconInDescription_Previews: PreviewProvider {
    static var previews: some View {
        IconInDescription(iconName: "baby.feet", levelTrim: 0.3)
            .preferredColorScheme(.dark)
//            .previewLayout(.sizeThatFits)
    }
}
