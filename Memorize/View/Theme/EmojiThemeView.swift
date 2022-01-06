//
//  EmojiThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 05.01.2022.
//

import SwiftUI

//MARK: EmojiThemeView

struct EmojiThemeView: View {
    
    //MARK: Properties
    
    let theme: Theme
    let isActiveTheme: Bool
    
    private var pivotEmoji: Double {
        isActiveTheme ? 10 : 0
    }
    private var opacityEmoji: Double {
        isActiveTheme ? 1 : Constant.Opacity.strong
    }
    private var opacityShadowEmoji: Double {
        isActiveTheme ? Constant.Opacity.strong : 0
    }
    private var radiusShadowEmoji: Double {
        isActiveTheme ? 10 : 0
    }
    private var yShadowEmoji: Double {
        isActiveTheme ? 30 : 0
    }
    private let xShadowEmoji: Double = 3
    
    private var occupiedSpace: CGFloat {
        UIScreen.main.bounds.width / 2
    }
    
    //MARK: Initializer
    
    init(_ theme: Theme, _ isActiveTheme: Bool) {
        self.theme = theme
        self.isActiveTheme = isActiveTheme
    }
    
    var body: some View {
        VStack {
            Text(theme.avatar)
                .font(.sizeEmojiTheme)
                .fixedSize()
                .opacity(opacityEmoji)
                .rotationEffect(.degrees(pivotEmoji))
                .shadow(color: .black.opacity(opacityShadowEmoji),
                        radius: radiusShadowEmoji,
                        x: xShadowEmoji, y: yShadowEmoji)
        }
        .frame(maxWidth: occupiedSpace, alignment: .center)
    }
}

struct EmojiThemeView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiThemeView(themeData.first!, true)
    }
}
