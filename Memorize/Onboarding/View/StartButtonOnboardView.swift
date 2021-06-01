//
//  SkipButtonOnboard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct SkipButtonOnboard: View {
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    var color: Color
    
    var body: some View {
        Button(action: {
            print("Всунуть логику")
            //Логика для визуализации перехода по меню )))
            withAnimation {
                showMenu.toggle()
                selectedTab = "Новая игра"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showMenu.toggle()
                        
                    }
                }
            }
        }) {
            Text("играть")
                .foregroundColor(color)
                .font(.title)
                .bold()
        }
    }
}

struct StartButtonOnboard_Previews: PreviewProvider {
    static var previews: some View {
        SkipButtonOnboard(selectedTab: .constant("Новая игра"), showMenu: .constant(false), color: .red)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
