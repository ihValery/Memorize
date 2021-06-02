//
//  NameTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct NameTheme: View {
    var theme: Theme
    @Binding var selectedTheme: Int
    
    var body: some View {
        Text(theme.name)
            .font(.callout)
            .fontWeight(.bold)
            .foregroundColor(selectedTheme == theme.id ? .white : .black.opacity(0.1))
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
//            .background(Capsule().stroke(selectedTheme == theme.id ? Color.white : Color.black.opacity(0.1), lineWidth: 2))
    }
}

struct ChoseButton_Previews: PreviewProvider {
    static var previews: some View {
        NameTheme(theme: themeData.first!, selectedTheme: .constant(1))
            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
    }
}
