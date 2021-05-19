//
//  MainThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct MainThemeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Все темы")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.colorTextNewGame)
                    .padding(.leading)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    ForEach(dataTheme) { item in
                        CardTheme(data: item)
                    }
                }
            })
        }
        .background(LinearGradient(gradient: Gradient(colors: [.purpleTheme, ThemeFactory.themeApp.color]),
                                    startPoint: .topLeading, endPoint: .bottomTrailing)
                         .ignoresSafeArea())
    }
}

struct MainThemeView_Previews: PreviewProvider {
    static var previews: some View {
        MainThemeView()
    }
}

struct ThemeData : Identifiable {
    
    var id : Int
    var level : CGFloat
    var avatar : String
    var name : String
    var color : Color
}

var dataTheme = [
    ThemeData(id: 1, level: 0.1, avatar: "🧚‍♀️", name: "Child", color: Color.yellowTheme),
    ThemeData(id: 2, level: 0.2, avatar: "🐶", name: "Animals", color: Color.indigoTheme),
    ThemeData(id: 3, level: 0.3, avatar: "🐘", name: "Zoo", color: Color.tealTheme),
    ThemeData(id: 4, level: 0.5, avatar: "🦇", name: "Halloween", color: Color.orangeTheme),
    ThemeData(id: 5, level: 0.7, avatar: "🏓", name: "Sport", color: Color.greenTheme),
    ThemeData(id: 6, level: 0.9, avatar: "🇫🇮", name: "Flags", color: Color.blueTheme)
]
