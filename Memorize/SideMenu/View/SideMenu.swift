//
//  SideMenu.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab: String
    //For Hero Animation Slide
    @Namespace var animation
    @Binding var showMenu: Bool

    var body: some View {
        //Боковое меню
        VStack(alignment: .leading, spacing: 15) {
            ProFile()
            
            //tab Buttons
            VStack(alignment: .leading, spacing: 10) {
                TabButton(image: "gamecontroller", title: "Новая игра", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "clock.arrow.circlepath", title: "Счет", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "bell.badge", title: "Уведомление", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "gearshape", title: "Темы", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "questionmark.circle", title: "Помощь", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            SignOutButton()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(selectedTab: "Новая игра", showMenu: true)
            .preferredColorScheme(.dark)
    }
}
