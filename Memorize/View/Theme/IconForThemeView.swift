//
//  IconForThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

//MARK: IconForThemeView

struct IconForThemeView: View {
    
    //MARK: Properties
    
    let icon: IconForTheme
    let theme: Theme
    let activeTheme: Bool
    
    private let lineWidth: CGFloat = 5
    private var cardRotationAngle: Double {
        activeTheme ? 270 : -90
    }
    private var sizeIcon: CGFloat {
        isWithBangs ? 28 : 20
    }
    private var trimTo: CGFloat {
        activeTheme ? icon.forTrim : 0
    }
    
    //MARK: Initializer
    
    init(_ icon: IconForTheme, _ theme: Theme, _ activeTheme: Bool) {
        self.icon = icon
        self.theme = theme
        self.activeTheme = activeTheme
    }
    
    var body: some View {
        Image(icon.rawValue)
            .resizable()
            .frame(width: sizeIcon, height: sizeIcon)
            .padding()
            .background(
                ZStack {
                    theme.color
                    Circle()
                        .stroke(Color.black.opacity(Constant.Opacity.ten), lineWidth: lineWidth)
                    Circle()
                        .trim(from: 0, to: trimTo)
                        .stroke(Color.white, lineWidth: lineWidth)
                }
                    .rotationEffect(
                        .degrees(cardRotationAngle)
                    )
            )
            .clipShape(Circle())
    }
}
