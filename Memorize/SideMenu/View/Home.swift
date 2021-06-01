//
//  Home.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    
    //Hiding tab bar
    init(selectedTab: Binding<String>, showMenu: Binding<Bool>) {
        self._selectedTab = selectedTab
        self._showMenu = showMenu
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        //Tab View with tabs
        TabView(selection: $selectedTab) {
            
            //Views
            EmojiMemoryGameView(viewModelGame: EmojiMemoryGame()).tag("Новая игра")
            Score().tag("Счет")
            ThemeViewMain().tag("Темы")
            NotificationView().tag("Уведомление")
            OnboardingView(showMenu: $showMenu, selectTab: $selectedTab).tag("Помощь")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView()
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
