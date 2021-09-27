//
//  BackgroundCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct BackgroundCard: View {
    var theme: Theme
    @Binding var selectedTheme: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(selectedTheme == theme.id ? theme.color : Color.white.opacity(0.4))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: getRect().width / 1.8)
            
            HStack {
                Spacer()
                
                VStack {
                    VStack {
                        IconInDescription(iconName: "baby.feet", theme: theme, parametr: theme.ageFloat, selectedTheme: $selectedTheme)
                        HStack {
                            IconInDescription(iconName: "timer.deadline", theme: theme, parametr: theme.timer, selectedTheme: $selectedTheme)
                            IconInDescription(iconName: "level.stairs.up", theme: theme, parametr: theme.levelFloat, selectedTheme: $selectedTheme)
                        }
                    }
                    .opacity(selectedTheme == theme.id ? 1 : 0.3)
                    
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
        BackgroundCard(theme: themeData.first!, selectedTheme: .constant(0))
//                    .preferredColorScheme(.dark)
    }
}
