//
//  TabPanelView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct TabPanelView: View {
    
    //MARK: - Properties
    
    @Binding var selectedTab: String

    @ObservedObject var session: SessionFirebase

    @State private var onAnimation = false

    //MARK: - Initializer

    init(selectedTab: Binding<String>, session: SessionFirebase) {
        self._selectedTab = selectedTab
        self.session = session
        UITabBar.appearance().isHidden = true
    }
        
    //MARK: - Body

    var body: some View {
        TabView(selection: $selectedTab) {
            GameBoardMainView(viewModelGame: GameBoardViewModel(), scoreListViewModel: ResultsTableViewModel()).tag("Новая игра")
            ScoreTableMainView(onAnimation: $onAnimation, session: session).tag("Счет")

                .onAppear {
                    onAnimation.toggle()
                }

                .onDisappear {
                    onAnimation.toggle()
                }
            
            ThemeMainView().tag("Темы")
            NotificationView().tag("Уведомление")
            RulesView().tag("Правила")
        }
    }
    
}

struct Home_Previws: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
    }
}
