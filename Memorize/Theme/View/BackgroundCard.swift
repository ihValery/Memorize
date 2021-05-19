//
//  BackgroundCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct BackgroundCard: View {
    var data: ThemeData
    private let width = UIScreen.main.bounds.width - 20
    @Binding var selectedTheme: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(selectedTheme == true ? Color.white.opacity(0.4) : data.color.opacity(1))
//                .fill(Color.white.opacity(selectedTheme == true ? 0.4 : 0.9))
                .frame(width: width, height: width / 1.7)
            HStack {
                Spacer()
                VStack(spacing: 15) {
                    IconInDescription(data: data, iconName: "baby.feet", rotateCard: $selectedTheme)
                    HStack {
                        IconInDescription(data: data, iconName: "timer.deadline", rotateCard: $selectedTheme)
                        IconInDescription(data: data, iconName: "level.stairs.up", rotateCard: $selectedTheme)
                    }
                    
                    ChoseButton(rotateCard: $selectedTheme)
                }
                .padding(.trailing, 40)
            }
        }
        .rotation3DEffect(.degrees(selectedTheme == true ? -20 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
        .offset(x: selectedTheme == true ? -30 : 0)
    }
}

struct BackgroundCard_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCard(data: dataTheme.first!, selectedTheme: .constant(true))
                    .preferredColorScheme(.dark)
    }
}
