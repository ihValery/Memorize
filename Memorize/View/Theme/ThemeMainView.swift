//
//  ThemeMainView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

//MARK: ThemeMainView

struct ThemeMainView: View {
    
    //MARK: Properties
    
    private var paddingVertical: CGFloat? {
        isWithBangs ? 25 : nil
    }

    @State private var selectedTheme: Int = UserDefaults.standard.integer(forKey: Constant.Theme.key)
    
    @ObservedObject private var theme = ThemeViewModel.shared
        
    var body: some View {
        VStack {
            TitleTextStyleView(Constant.Theme.title)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(themeData) { item in
                    CardThemeView(item, selectedTheme)
                        .padding(.vertical, paddingVertical)
                    
                        .onTapGesture {
                            theme.current = item.id
                            withAnimation(.easeInOut) {
                                selectedTheme = theme.current
                            }
                        }
                }
                .padding(.top)
            }
        }
        .background(
            LinearGradient(
                colors:[themeData[theme.current].color.opacity(Constant.Opacity.meddle),
                        .sideMenuStart],
                startPoint: .topTrailing, endPoint: .bottomLeading
            ).ignoresSafeArea()
        )
    }
}

struct ThemeMainView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeMainView()
    }
}
