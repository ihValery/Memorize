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
            
            //Profile
            Image("proFiler2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .top)
                .cornerRadius(10)
            //Padding top for Top Close Button
                .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: -5) {
                Text("Апполония")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Сицилийская")
            }
            .padding(.top, -15)
            .foregroundColor(.colorTextNewGame)
            
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
            
            //SignOut button
            VStack(alignment: .leading, spacing: -10) {
                SignOutButton()
            }
//            VStack(alignment: .leading, spacing: -10) {
//                TabButton(image: "rectangle.lefthalf.inset.fill.arrow.left", title: "Выйти", showMenu: showMenu, selectedTab: .constant(""), animation: animation)
//                    .padding(.horizontal, -15)
//                Text("Версия 3.4.20")
//                    .font(.caption)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.colorTextNewGame)
////                    .foregroundColor(.white)
//                    .opacity(0.4)
//            }
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
