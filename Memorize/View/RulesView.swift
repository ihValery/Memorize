//
//  RulesView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.06.21.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                GeometryReader { gr in
                    Image("backgroundRules")
                        .resizable()
                        .offset(y: -gr.frame(in: .global).origin.y / 1.3 - 160)
                }
                
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 25).frame(height: 170).opacity(0.3)
                        .overlay(Text("Классическая игра «Мэмори» или «Найди пару!».").foregroundColor(.defaultText).padding())
                    
                    RoundedRectangle(cornerRadius: 25).frame(height: 170).opacity(0.3)
                        .overlay(Text("Направлена на эффективное развитие способности к запоминанию и концентрации внимания.").foregroundColor(colorScheme == .dark ? .red : .green ).padding())
                    
//                    RoundedRectangle(cornerRadius: 25).frame(height: 170).opacity(0.3)
//                        .overlay(Text("В начале игры на экран выставляются карты рубашкой вверх.").foregroundColor(.defaultText).padding())
//                    RoundedRectangle(cornerRadius: 25).frame(height: 170).opacity(0.3)
//                        .overlay(Text("Игрок может в желаемой последовательности открывать карты.").foregroundColor(.defaultText).padding())
//                    RoundedRectangle(cornerRadius: 25).frame(height: 170).opacity(0.3)
//                        .overlay(Text("Одновременно могут быть открыты только две карты. Открытие третьей карты приведет к переворачиванию первых двух.").foregroundColor(.defaultText).padding())
//                    RoundedRectangle(cornerRadius: 25).frame(height: 170).opacity(0.3)
//                        .overlay(Text("Пара карт с одинаковой картинкой считаеться найденой, когда открыты одновременно лишь они.").foregroundColor(.defaultText).padding())
                    
                    VisualEffect2View(effect: UIBlurEffect(style: colorScheme == .dark ? .systemUltraThinMaterialDark : .systemUltraThinMaterialLight))
                        .cornerRadius(25).frame(height: 150)
                        .overlay(Text("Пара карт с одинаковой картинкой считаеться найденой, когда открыты одновременно лишь они.").foregroundColor(.defaultText).padding())

                    VisualEffectView(style: colorScheme == .dark ? .systemUltraThinMaterialDark : .systemUltraThinMaterialLight)
                        .cornerRadius(25).frame(height: 150)

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

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
