//
//  IconInDescription.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct IconInDescription: View {
    var iconName: String
    var theme: Theme
    var parametr: CGFloat?
    @Binding var selectedTheme: Int
    
    var body: some View {
        Image(iconName)
            .resizable()
            .frame(width: 25, height: 25)
            .padding()
            .background(
                ZStack {
                    theme.color
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: parametr ?? 0.5)
                        .stroke(Color.white, lineWidth: 5)
                }
                .rotationEffect(
                    .degrees(selectedTheme == theme.id ? 270 : -90))
            )
            .clipShape(Circle())
    }
}

struct iconInDescription_Previews: PreviewProvider {
    static var previews: some View {
        IconInDescription(iconName: "baby.feet", theme: themeData.first!, selectedTheme: .constant(1))
            .preferredColorScheme(.dark)
//            .previewLayout(.sizeThatFits)
    }
}
