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
    private let cardHeight = round( UIScreen.main.bounds.width / 1.8 )

    var body: some View {
        HStack {
            EmojiThemeView(theme, isActiveTheme)
            
            CardDescriptionThemeView(theme, isActiveTheme)

        }
        .frame(maxWidth: .infinity)
        .frame(height: cardHeight)
        .background(
            RoundedRectangle(cornerRadius: Constant.cornerRadius)
                .fill(isActiveTheme ? theme.color : .white.opacity(Constant.Opacity.meddle))
        )
        .padding(.horizontal)
        .rotation3DEffect(.degrees(isActiveTheme ? 0 : 22), axis: (x: 0, y: 1, z: 0))
        .offset(x: isActiveTheme ? 0 : (isWithBangs ? 32 : 22))
    }

//    //MARK: Private Methods
//
//    private func activeTheme() -> Bool {
//        selectedTheme == theme.id
//    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardThemeView(theme: themeData.first!, selectedTheme: 1)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 400))
            .preferredColorScheme(.dark)
        CardThemeView(theme: themeData.first!, selectedTheme: 0)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 400))
            .preferredColorScheme(.dark)
    }
}

struct CardDescriptionThemeView: View {
    
    //MARK: Properties
    let theme: Theme
    let isActiveTheme: Bool
    
    private var opacity: Double {
        isActiveTheme ? 1 : Constant.Opacity.meddle
    }
    private var paddingTrailing: CGFloat {
        isWithBangs ? 40 : 20
    }
    
    //MARK: Initializer
    
    init(_ theme: Theme, _ isActiveTheme: Bool) {
        self.theme = theme
        self.isActiveTheme = isActiveTheme
    }

    var body: some View {
        VStack {
            VStack {
                IconForThemeView(.age(trim: theme.ageFloat), theme, isActiveTheme)
                
                HStack {
                    IconForThemeView(.timer(trim: theme.timer), theme, isActiveTheme)
                    IconForThemeView(.level(trim: theme.levelFloat), theme, isActiveTheme)
                }
            }
            
            Text(theme.name)
                .font(.title3.bold())
                .lineLimit(1)
                .foregroundColor(.white)
        }
        .opacity(opacity)
        .padding(.trailing, paddingTrailing)
    }
}
