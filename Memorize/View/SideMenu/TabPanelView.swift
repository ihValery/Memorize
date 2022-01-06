//
//  TabPanelView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

//MARK: TabPanelView

struct TabPanelView: View {
    
    //MARK: Properties
    
    @Binding var selectedTab: String
    
    @ObservedObject var session: SessionFirebase
    
    //MARK: Initializer
    
    init(_ selectedTab: Binding<String>, _ session: SessionFirebase) {
        self._selectedTab = selectedTab
        self.session = session
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GameBoardMainView(viewModelGame: GameBoardViewModel(), scoreListViewModel: ResultsTableViewModel())
                .tag(Constant.SideMenu.game)

            ScoreTableMainView(session: session)
                .tag(Constant.SideMenu.score)

            ThemeMainView()
                .tag(Constant.SideMenu.theme)

            NotificationView()
                .tag(Constant.SideMenu.notification)

            RulesView()
                .tag(Constant.SideMenu.rule)
        }
    }
}

struct Home_Previws: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
    }
}
