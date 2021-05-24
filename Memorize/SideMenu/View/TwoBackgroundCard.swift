//
//  TwoBackgroundCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct TwoBackgroundCard: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Color.element
            .opacity(0.6)
            .cornerRadius(showMenu ? 15 : 0)
            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
            .offset(x: showMenu ? -25 : 0)
            .padding(.vertical, 30)
        
        Color.element
            .opacity(0.4)
            .cornerRadius(showMenu ? 15 : 0)
            .offset(x: showMenu ? -50 : 0)
            .padding(.vertical, 60)
    }
}
