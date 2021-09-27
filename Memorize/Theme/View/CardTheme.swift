//
//  CardTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct CardTheme: View {
    var theme: Theme
    @Binding var selectedTheme: Int
    
    var body: some View {
        ZStack {
            BackgroundCard(theme: theme, selectedTheme: $selectedTheme)
            
            VStack {
                Text(theme.avatar)
                    .rotationEffect(.degrees(selectedTheme == theme.id ? 0 : 10))
                    .font(.system(size: getRect().width / 2))
                    .shadow(color: .black.opacity(selectedTheme == theme.id ? 0.5 : 0.4),
                            radius: selectedTheme == theme.id ? 4 : 10,
                        x: 3, y: selectedTheme == theme.id ? 10 : 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 25)
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardTheme(theme: themeData.first!, selectedTheme: .constant(2))
            .preferredColorScheme(.dark)
    }
}
