//
//  IconDescription.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct IconDescription: View {
    var icon: IconDesc
    var theme: Theme
    var activeTheme: Bool
    
    init(_ icon: IconDesc, _ theme: Theme, _ activeTheme: Bool) {
        self.icon = icon
        self.theme = theme
        self.activeTheme = activeTheme
    }
    
    var body: some View {
        Image(icon.rawValue)
            .resizable()
            .frame(width: withBangs ? 28 : 20, height: withBangs ? 28 : 20)
            .padding()
            .background(
                ZStack {
                    theme.color
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: icon.forTrim)
                        .stroke(Color.white, lineWidth: 5)
                }
                .rotationEffect(
                    .degrees(activeTheme ? 270 : -90))
            )
            .clipShape(Circle())
    }
}
