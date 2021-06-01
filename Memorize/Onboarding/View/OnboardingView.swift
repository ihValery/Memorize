//
//  OnboardingView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct OnboardingView: View {
    var cardsOnboard: [CardOnboard] = cardOnboardData
    @Binding var showMenu: Bool
    @Binding var selectTab: String

    var body: some View {
        TabView {
            ForEach(cardsOnboard[0..<cardsOnboard.count]) { item in
                CardOnboardView(cardOnboard: item, showMenu: $showMenu, selectTab: $selectTab)
            }
        }
        .tabViewStyle(PageTabViewStyle())
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showMenu: .constant(false), selectTab: .constant("Новая игра"))
    }
}
