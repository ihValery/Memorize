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
            .padding(.top, getRect().height < 750 ? 0 : 15)
    }
}
