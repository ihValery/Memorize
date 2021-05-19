//
//  CardTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct CardTheme: View {
    
    
    var body: some View {
        ZStack {
            BackgroundCard()
            Text("🧚‍♀️")
                .font(.system(size: UIScreen.main.bounds.width / 1.9))
                .shadow(color: .black.opacity(0.4), radius: 10, x: 3, y: 30)
                .offset(x: -90)
        }
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardTheme()
    }
}
