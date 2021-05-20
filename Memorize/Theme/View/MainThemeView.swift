//
//  MainThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct MainThemeView: View {
    let themes: [ThemeCHANGEname] = themeData
    @ObservedObject var theme = ThemeSettings()
    @State var selectedTheme: Int = UserDefaults.standard.integer(forKey: "Theme")
    
    var body: some View {
        VStack {
            HStack {
                Text("Выбери тему")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading, 60)
                    .padding(.bottom, -1)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(themes) { item in
                        CardTheme(theme: item, selectedTheme: $selectedTheme)
                            .onTapGesture {
                                self.theme.themeSettings = item.id
                                UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                withAnimation {
                                    selectedTheme = self.theme.themeSettings
                                }
                            }
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors:[.purpleTheme, themes[self.theme.themeSettings].color.opacity(0.4)]),
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea())
    }
}

struct MainThemeView_Previews: PreviewProvider {
    static var previews: some View {
        MainThemeView()
    }
}
