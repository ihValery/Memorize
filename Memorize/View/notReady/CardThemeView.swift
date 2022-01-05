//
//  CardThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

//MARK: CardThemeView

struct CardThemeView: View {
    
    //MARK: Properties

    let theme: Theme
    let selectedTheme: Int
    
    private var isActiveTheme: Bool {
        selectedTheme == theme.id
    }

    var body: some View {
        HStack {
            EmojiThemeView(theme, isActiveTheme)
            
            Spacer()
            
            VStack {
                VStack {
                    IconForThemeView(.age(trim: theme.ageFloat), theme, activeTheme())
                    HStack {
                        IconForThemeView(.timer(trim: theme.timer), theme, activeTheme())
                        IconForThemeView(.level(trim: theme.levelFloat), theme, activeTheme())
                    }
                }
                .opacity(activeTheme() ? 1 : 0.3)
                
                Text(theme.name)
                    .font(.title3.bold())
                    .fixedSize()
                    .lineLimit(1)
                    .padding(.top, isWithBangs ? 15 : 0)
                    .foregroundColor(activeTheme() ? .white : .black.opacity(0.1))
            }
            .padding(.trailing, isWithBangs ? 40 : 20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: getScreeSize().width / 1.8)
        .background(
            RoundedRectangle(cornerRadius: Constant.cornerRadius)
                .fill(activeTheme() ? theme.color : .white.opacity(Constant.Opacity.forty))
        )
        .padding(.horizontal)
        .rotation3DEffect(.degrees(activeTheme() ? 0 : 22), axis: (x: 0, y: 1, z: 0))
        .offset(x: activeTheme() ? 0 : (isWithBangs ? 32 : 22))
    }

    //MARK: Private Methods

    private func activeTheme() -> Bool {
        selectedTheme == theme.id
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardThemeView(theme: themeData.first!, selectedTheme: 1)
            .preferredColorScheme(.dark)
    }
}
