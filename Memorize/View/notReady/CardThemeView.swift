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

    var theme: Theme
    var selectedTheme: Int

    var body: some View {
        HStack {
            VStack {
                Text(theme.avatar)
                    .font(.system(size: getScreeSize().width / 2.5))
                    .fixedSize()
                    .opacity(activeTheme() ? 1 : 0.5)
                    .rotationEffect(.degrees(activeTheme() ? 10 : 0))
                    .shadow(color: .black.opacity(activeTheme() ? 0.5 : 0),
                            radius: activeTheme() ? 10 : 0,
                            x: 3, y: activeTheme() ? 30 : 0)
            }
            .frame(maxWidth: getScreeSize().width / 2, alignment: .center)
            
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
            RoundedRectangle(cornerRadius: 25)
                .fill(activeTheme() ? theme.color : .white.opacity(0.4))
        )
        .padding(.horizontal)
        .rotation3DEffect(.degrees(activeTheme() ? 0 : 22), axis: (x: 0, y: 1, z: 0))
        .offset(x: activeTheme() ? 0 : 22)
    }

    //MARK: Private Methods
    
    private func activeTheme() -> Bool {
        selectedTheme == theme.id
    }
    
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardThemeView(theme: themeData.first!, selectedTheme: 0)
            .preferredColorScheme(.dark)
    }
}
