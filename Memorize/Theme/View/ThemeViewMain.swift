//
//  ThemeViewMain.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct ThemeViewMain: View {
    @ObservedObject var theme = ThemeSettings.shared
    @State private var selectedTheme: Int = UserDefaults.standard.integer(forKey: "Theme")
    
    var body: some View {
        VStack {
            HStack {
                Text("Выбери тему")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading, 60)
//                    .padding(.top, -10)
                    .padding(.bottom, -1)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(themeData) { item in
                        CardTheme(theme: item, selectedTheme: $selectedTheme)
                            .onTapGesture {
                                theme.current = item.id
                                withAnimation(.easeInOut) {
                                    selectedTheme = theme.current
                                }
                            }
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors:[themeData[theme.current].color.opacity(0.4), .purpleTheme]),
                                   startPoint: .topTrailing, endPoint: .bottomLeading)
                        .ignoresSafeArea())
    }
}

struct MainThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeViewMain()
    }
}
