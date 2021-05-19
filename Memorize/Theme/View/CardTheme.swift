//
//  CardTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct CardTheme: View {
    
    
    var body: some View {
        HStack {
            Text("🧚‍♀️")
                .font(.system(size: UIScreen.main.bounds.width / 2))
                .shadow(color: .black.opacity(0.4), radius: 10, x: 3, y: 30)
            VStack(spacing: 10) {
                IconInDescription(iconName: "baby.feet", levelTrim: 0.3)
                HStack(spacing: 10) {
                    IconInDescription(iconName: "timer.deadline", levelTrim: 0.6)
                    IconInDescription(iconName: "level.stairs.up", levelTrim: 0.8)
                }
                
//                ChoseButton()
                Button(action: {
                    
                }) {
                    Text("Выбрать")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                        
                }
                    .padding(.top, 20)
            }
            .padding(.trailing, 20)
            .rotation3DEffect(.degrees(-14), axis: (x: 0, y: 1, z: 0))
        }
//        .background(BackgroundCard())
        .background(
            Color.red.opacity(0.4)
                .cornerRadius(25)
                .rotation3DEffect(.degrees(-20), axis: (x: 0, y: 1, z: 0))
                .padding(.trailing, 24))
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        CardTheme()
    }
}
