//
//  BackgroundCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct BackgroundCard: View {
    private let width = UIScreen.main.bounds.width - 20
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.red.opacity(0.4))
                .frame(width: width, height: width / 1.7)
            HStack {
                Spacer()
                VStack {
                    IconInDescription(iconName: "baby.feet", levelTrim: 0.4)
                        .padding(.bottom, 10)
                    HStack {
                        IconInDescription(iconName: "timer.deadline", levelTrim: 0.6)
                        IconInDescription(iconName: "level.stairs.up", levelTrim: 0.9)
                    }
                    ChoseButton()
                        .padding(.top, 15)
                }
                .padding(.trailing, 40)
            }
        }
        .rotation3DEffect(.degrees(-20), axis: (x: 0.0, y: 1.0, z: 0.0))
        .offset(x: -30)
    }
}

struct BackgroundCard_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCard()
        //            .preferredColorScheme(.dark)
    }
}
