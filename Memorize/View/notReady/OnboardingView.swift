//
//  OnboardingView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - Properties
    
    var cardsOnboard: [CardOnboard] = cardOnboardData
    
    //MARK: - Body
    
    var body: some View {
        TabView {
            ForEach(cardsOnboard[0..<cardsOnboard.count]) { item in
                CardOnboardingView(cardOnboard: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
