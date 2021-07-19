//
//  TopPanel.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.07.2021.
//

import SwiftUI

struct TopPanel: View {
    @Binding var signInSelected: Bool
    
    var body: some View {
        HStack(spacing: 1) {
            SignSelectButton(text: "Вход")
                .opacity(!signInSelected ? 1 : 0.4)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        signInSelected = false
                    }
                }
            
            SignSelectButton(text: "Регистрация")
                .opacity(signInSelected ? 1 : 0.4)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        signInSelected = true
                    }
                }
        }
    }
}

struct TopPanel_Previews: PreviewProvider {
    static var previews: some View {
        TopPanel(signInSelected: .constant(true))
    }
}
