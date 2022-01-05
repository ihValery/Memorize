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
    
    @State private var selectedTheme: Int = UserDefaults.standard.integer(forKey: Constant.Theme.key)
    
    @ObservedObject private var theme = ThemeViewModel.shared
    
    var body: some View {
        VStack {
            TitleView(Constant.Theme.title)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(themeData) { item in
                        CardThemeView(theme: item, selectedTheme: selectedTheme)
                            .padding(.vertical)
                        
                            .onTapGesture {
                                theme.current = item.id
                                withAnimation(.easeInOut) {
                                    selectedTheme = theme.current
                                }
                            }
                    }
                }
                .padding(.top)
            }
        }
        .background(
            LinearGradient(
                colors:[themeData[theme.current].color.opacity(Constant.Opacity.forty),
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
