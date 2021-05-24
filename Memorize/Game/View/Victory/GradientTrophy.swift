//
//  GradientTrophy.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 23.05.21.
//

import SwiftUI

struct GradientTrophy: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var theme = ThemeSettings.shared
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.purpleTheme, themeData[self.theme.current].color]),
                                 startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 300)
            .mask(MaskImageView())
    }
}

struct MaskImageView: View {
    var body: some View {
        Text("🏆")
            .font(.system(size: 250))
    }
}

struct GradientTrophy_Previews: PreviewProvider {
    static var previews: some View {
        GradientTrophy()
    }
}