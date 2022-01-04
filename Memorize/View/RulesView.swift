//
//  RulesView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.06.21.
//

import SwiftUI

//MARK: RulesView

struct RulesView: View {
    
    //MARK: Properties
    
    fileprivate struct InternalConstant {
        fileprivate static let ruleOne = "Классическая игра «Мэмори» или «Найди пару!»."
        fileprivate static let nameScreen = "Правило"
    }
    
    
    fileprivate enum Rule {
        static let background = "backgroundRules"
        
        static let one        = "Классическая игра «Мэмори» или «Найди пару!»."
        static let two        = "Направлена на эффективное развитие способности к запоминанию и концентрации внимания."
        static let three      = "В начале игры на экран выставляются карты рубашкой вверх."
        static let four       = "Игрок может в желаемой последовательности открывать карты."
        static let five       = "Одновременно могут быть открыты только две карты."
        static let six        = "Пара карт с одинаковой картинкой считаеться найденой, когда открыты одновременно лишь они."
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text(InternalConstant.nameScreen)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading, 60)
                    .padding(.top, isWithBangs ? -5 : -1)
                    .padding(.bottom, -1)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    GeometryReader { gr in
                        Image(Rule.background)
                            .resizable()
                            .offset(y: -gr.frame(in: .global).origin.y / 1.3 - 160)
                    }
                    
                    VStack(spacing: 30) {
                        CardRuleView(title: InternalConstant.ruleOne).padding(.top, -20)
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
        .background(Color.ruleTop.ignoresSafeArea())
    }
    
}

//MARK: CardRuleView

struct CardRuleView: View {
    
    //MARK: Properties
    
    let title: String
        
    var body: some View {
        MatteEffectView()
            .cornerRadius(25)
            .frame(height: 170)
            .overlay(
                Text(title)
                    .shadow(color: .ruleShadow, radius: 20, x: 0, y: 0)
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
