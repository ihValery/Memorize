//
//  ThemeViewMain.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct ThemeViewMain: View {
    @ObservedObject var theme = ThemeSettings.shared
    @State var selectedTheme: Int = UserDefaults.standard.integer(forKey: "Theme")
    
    var body: some View {
        VStack {
            HStack {
                Text("Выбери тему")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading, 60)
                    .padding(.top, -10)
                    .padding(.bottom, -1)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(themeData) { item in
                        CardTheme(theme: item, selectedTheme: $selectedTheme)
                            .onTapGesture {
                                self.theme.current = item.id
                                UserDefaults.standard.set(self.theme.current, forKey: "Theme")
                                withAnimation {
                                    selectedTheme = self.theme.current
                                }
                            }
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors:[.purpleTheme, themeData[self.theme.current].color.opacity(0.4)]),
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea())
    }
}

struct MainThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeViewMain()
    }
}
