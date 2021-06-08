//
//  Home.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        //Tab View with tabs
        TabView(selection: $selectedTab) {
            
            EmojiMemoryGameView(viewModelGame: EmojiMemoryGame()).tag("Новая игра")
            Score().tag("Счет")
            ThemeViewMain().tag("Темы")
            NotificationView().tag("Уведомление")
            RulesView().tag("Правила")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
    }
}

struct Score: View {
    var body: some View {
        NavigationView {
            Text("Score")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Score")
        }
    }
}
