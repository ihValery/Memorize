//
//  Home.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    @ObservedObject var session: SessionFirebase
    
    init(selectedTab: Binding<String>, session: SessionFirebase) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
        self.session = session
    }
    
    var body: some View {
        //Tab View with tabs
        TabView(selection: $selectedTab) {
            
            EmojiMemoryGameView(viewModelGame: EmojiMemoryGame()).tag("Новая игра")
            ScoreTableViewMain(session: session).tag("Счет")
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
