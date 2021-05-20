//
//  CardTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct CardTheme: View {
    var theme: ThemeCHANGEname
    @Binding var selectedTheme: Int
    
    var body: some View {
        ZStack {
            BackgroundCard(theme: theme, selectedTheme: $selectedTheme)
            
            Text(theme.avatar)
                .rotationEffect(.degrees(selectedTheme == theme.id ? 0 : 10))
                .font(.system(size: UIScreen.main.bounds.width / 2))
                .offset(x: -90)
                .shadow(color: .black.opacity(selectedTheme == theme.id ? 0.5 : 0.4),
                        radius: selectedTheme == theme.id ? 4 : 10,
                        x: 3, y: selectedTheme == theme.id ? 10 : 30)
        }
        .padding(.top, 25)
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardTheme(theme: themeData.first!, selectedTheme: .constant(1))
            .preferredColorScheme(.dark)
    }
}
