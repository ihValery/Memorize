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
                .fill(activeTheme() ? theme.color : Color.white.opacity(0.4))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: getRect().width / 1.8)
            
            HStack {
                Spacer()
                
                VStack {
                    VStack {
                        IconInDescription(iconName: "baby.feet", theme: theme, parametr: theme.ageFloat, selectedTheme: selectedTheme)
                        HStack {
                            IconInDescription(iconName: "timer.deadline", theme: theme, parametr: theme.timer, selectedTheme: selectedTheme)
                            IconInDescription(iconName: "level.stairs.up", theme: theme, parametr: theme.levelFloat, selectedTheme: selectedTheme)
                        }
                    }
                    .opacity(activeTheme() ? 1 : 0.3)
                    
                    TitleCard(theme.name)
                        .foregroundColor(activeTheme() ? .white : .black.opacity(0.1))
                }
                .padding(.trailing, 40)
            }
        }
        .rotation3DEffect(.degrees(activeTheme() ? 0 : -20), axis: (x: 0, y: 0.7, z: 0))
        .frame(alignment: .center)
//        .offset(x: activeTheme() ? 0 : -30)
    }
    
    private func activeTheme() -> Bool {
        selectedTheme == theme.id
    }
}

struct BackgroundCard_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCard(theme: themeData.first!, selectedTheme: .constant(0))
//                    .preferredColorScheme(.dark)
    }
}
