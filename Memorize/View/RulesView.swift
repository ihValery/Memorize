//
//  RulesView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.06.21.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                GeometryReader { gr in
                    Image(Rule.background)
                        .resizable()
                        .offset(y: -gr.frame(in: .global).origin.y / 1.3 - 160)
                }
                
                VStack(spacing: 30) {
                    CardRuleView(title: Rule.one)
                    CardRuleView(title: Rule.two)
                    CardRuleView(title: Rule.three)
                    CardRuleView(title: Rule.four)
                    CardRuleView(title: Rule.five)
                    CardRuleView(title: Rule.six)
                }
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.top)
                
            }
            .ignoresSafeArea()
        }
    }
}

struct CardRuleView: View {
    let title: String
    
    var body: some View {
        MatteEffectView()
            .cornerRadius(25)
            .frame(height: 170)
            .overlay(
                Text(title)
                    .foregroundColor(.defaultText)
                    .padding()
            )
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
