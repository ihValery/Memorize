//
//  BackgroundCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct BackgroundCard: View {
    private let width = UIScreen.main.bounds.width - 20
    var theme: ThemeCHANGEname
    @Binding var selectedTheme: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(selectedTheme == theme.id ? theme.color.opacity(1) : Color.white.opacity(0.4))
                .frame(width: width, height: width / 1.7)
            HStack {
                Spacer()
                VStack(spacing: 15) {
                    IconInDescription(iconName: "baby.feet", theme: theme, parametr: theme.ageFloat, selectedTheme: $selectedTheme)
                    HStack {
                        IconInDescription(iconName: "timer.deadline", theme: theme, parametr: theme.timer, selectedTheme: $selectedTheme)
                        IconInDescription(iconName: "level.stairs.up", theme: theme, parametr: theme.levelFloat, selectedTheme: $selectedTheme)
                    }
                    
                    NameTheme(theme: theme, selectedTheme: $selectedTheme)
                }
                .padding(.trailing, 40)
            }
        }
        .rotation3DEffect(.degrees(selectedTheme == theme.id ? 0 : -20), axis: (x: 0.0, y: 1.0, z: 0.0))
        .offset(x: selectedTheme == theme.id ? 0 : -30)
    }
}

struct BackgroundCard_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCard(theme: themeData.first!, selectedTheme: .constant(1))
                    .preferredColorScheme(.dark)
    }
}
