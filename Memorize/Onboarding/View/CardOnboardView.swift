//
//  CardOnboardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct CardOnboardView: View {
    var cardOnboard: CardOnboard
    @State private var isAnimating: Bool = false
    
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //cardOnboard Image
                Image(cardOnboard.image)
                    .resizable()
                    .scaledToFill()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .frame(width: 200, height: 284)
                    .padding(.bottom, 40)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.7)) {
                            isAnimating = true
                        }
                    }
                    .scaleEffect(isAnimating ? 1 : 0.6)
                //cardOnboard Title
                Text(cardOnboard.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                //cardOnboard Headline
                Text(cardOnboard.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                //Button Start
//                StartButtonOnboardView(viewModelGame: EmojiMemoryGame())
//                StartButtonOnboardView()
            }//VStack
        }//ZStack
        //Добавляет действие, выполняемое при появлении этого представления.
//        .onAppear {
//            withAnimation(.easeInOut(duration: 0.7)) {
//                isAnimating = true
//            }
//        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: cardOnboard.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct CardOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        CardOnboardView(cardOnboard: cardOnboardData[1])
            .preferredColorScheme(.dark)
    }
}
