//
//  CardTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct CardTheme: View {
    var data: ThemeData
    @State var selectedTheme = true
    
    var body: some View {
        ZStack {
            BackgroundCard(data: data, selectedTheme: $selectedTheme)
            
            Text(data.avatar)
                .rotationEffect(.degrees(selectedTheme == true ? 10 : 0))
                .font(.system(size: UIScreen.main.bounds.width / 2))
                .offset(x: -90)
                .shadow(color: .black.opacity(selectedTheme == true ? 0.4 : 0.5),
                        radius: selectedTheme == true ? 10 : 4,
                        x: 3, y: selectedTheme == true ? 30 : 10)
        }
        .padding(.top, 25)
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardTheme(data: dataTheme.first!)
            .preferredColorScheme(.dark)
    }
}
