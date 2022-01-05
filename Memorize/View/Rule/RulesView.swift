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
        static let title = "Правило"
        static let background = "backgroundRules"
        
        static let ruleOne = "Классическая игра «Мэмори» или «Найди пару!»."
        static let ruleTwo = "Направлена на эффективное развитие способности к запоминанию и концентрации внимания."
        static let ruleThree = "В начале игры на экран выставляются карты рубашкой вверх."
        static let ruleFour = "Игрок может в желаемой последовательности открывать карты."
        static let ruleFive = "Одновременно могут быть открыты только две карты."
        static let ruleSix = "Пара карт с одинаковой картинкой считаеться найденой, когда открыты одновременно лишь они."
    }
    
    var body: some View {
        VStack {
            HStack {
                TitleView(InternalConstant.title)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    GeometryReader { gr in
                        Image(InternalConstant.background)
                            .resizable()
                            .offset(y: -gr.frame(in: .global).origin.y / 1.3 - 160)
                    }
                    
                    VStack(spacing: 30) {
                        CardRuleView(title: InternalConstant.ruleOne).padding(.top, -20)
                        CardRuleView(title: InternalConstant.ruleTwo)
                        CardRuleView(title: InternalConstant.ruleThree)
                        CardRuleView(title: InternalConstant.ruleFour)
                        CardRuleView(title: InternalConstant.ruleFive)
                        CardRuleView(title: InternalConstant.ruleSix)
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
