//
//  CompositeSideMenuView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct CompositeSideMenuView: View {
    
    //MARK: - Properties
    
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    
    //For Hero Animation Slide
    @Namespace private var animation
    
    @ObservedObject var session: SessionFirebase
    
    //MARK: - Initializer

    init(_ selectedTab: Binding<String>, _ showMenu: Binding<Bool>, _ session: SessionFirebase) {
        self._selectedTab = selectedTab
        self._showMenu = showMenu
        self.session = session
    }
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ProFileView(session: session)
            
            VStack(alignment: .leading, spacing: 10) {
                TabButtonView("gamecontroller", "Новая игра", animation, $showMenu, $selectedTab)
                
                TabButtonView("clock.arrow.circlepath", "Счет", animation, $showMenu, $selectedTab)
                
                TabButtonView("bell.badge", "Уведомление", animation, $showMenu, $selectedTab)
                
                TabButtonView("gearshape", "Темы", animation, $showMenu, $selectedTab)
                
                TabButtonView("questionmark.circle", "Правила", animation, $showMenu, $selectedTab)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            SignOutButtonView(session: session)
        }
        .padding(.leading, 14)
        .padding(.top)
    }
    
}

struct CompositeSideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
            .preferredColorScheme(.dark)
    }
}
