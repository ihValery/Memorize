//
//  CardOnboardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct CardOnboardView: View {
    var cardOnboard: CardOnboard
    @State private var isAnimating = false
    @Binding var showMenu: Bool
    @Binding var selectTab: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    SkipButtonOnboard(selectedTab: $selectTab, showMenu: $showMenu, color: cardOnboard.gradientColors.first ?? .black)
                        .padding(.trailing, 10)
                        .disabled(cardOnboard.id == cardOnboardData.count - 1)
                        .opacity(cardOnboard.id != cardOnboardData.count - 1 ? 1 : 0)
                }
                Spacer()
            }
            
            VStack(spacing: 20) {
                Image(cardOnboard.image)
                    .resizable()
                    .scaledToFill()
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 6, y: 8)
                    .frame(width: 200, height: 300)
                    .padding(.bottom, 40)
                    .scaleEffect(isAnimating ? 1.1 : 0.6)
                
                VStack {
                    Text(cardOnboard.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                        .offset(x: isAnimating ? 0 : getRect().width + 200)
                    
                    Text(cardOnboard.headline)
                        .padding(.horizontal, 16)
                        .offset(x: isAnimating ? 0 : getRect().width + 800)
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
            }
            
            SignUpButtonOnboarding(color: cardOnboard.gradientColors.first ?? .black)
                .offset(y: 280)
                .disabled(cardOnboard.id != cardOnboardData.count - 1)
                .opacity(cardOnboard.id == cardOnboardData.count - 1 ? 1 : 0)
        }
//        .frame(width: getRect().width - 20, height: getRect().height - 100)
        .background(LinearGradient(gradient: Gradient(colors: cardOnboard.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .padding(.horizontal, 15)
        .animation(.spring(dampingFraction: 0.5))
        .onAppear { isAnimating.toggle() }
    }
}

struct CardOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardOnboardView(cardOnboard: cardOnboardData[1], showMenu: .constant(false), selectTab: .constant("Новая игра"))
                .preferredColorScheme(.dark)
        }
    }
}
