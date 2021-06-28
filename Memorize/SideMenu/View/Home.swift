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
    @State private var onAnimation = false
    
    init(selectedTab: Binding<String>, session: SessionFirebase) {
        self._selectedTab = selectedTab
        self.session = session
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            EmojiMemoryGameView(viewModelGame: EmojiMemoryGame(), scoreListViewModel: ScoreListViewModel()).tag("Новая игра")
            ScoreTableViewMain(session: session, onAnimation: $onAnimation).tag("Счет")
                .onAppear {
                    print("onAppear - Home - \(onAnimation)")
                    onAnimation.toggle()
                }
                .onDisappear {
                    print("onDisappear - Home - \(onAnimation)")
                    onAnimation.toggle()
                }
            ThemeViewMain().tag("Темы")
            NotificationView().tag("Уведомление")
            RulesView().tag("Правила")
        }
    }
    
    //    private func startAnimation() -> Binding<Bool> {
    //        onAnimation = selectedTab == "Счет" ? true : false
    //        return $onAnimation
    //    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
    }
}
