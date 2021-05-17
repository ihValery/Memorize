//
//  SideMenuMainView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct SideMenuMainView: View {
    //Selected tab
    @State var selectedTab = "Game"
    @State var showMenu = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [.purpleTheme.opacity(colorScheme == .dark ? 0.5 : 1),
                                              themeApp.color]),
                            startPoint: .topLeading, endPoint: .bottomTrailing)
                //            Color.purpleTheme
                .ignoresSafeArea()
            
            //Боковое меню
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                SideMenu(selectedTab: $selectedTab)
            }
            
            ZStack {
                
                //two background cards
                Color.element
                    .opacity(0.6)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical, 30)
                
                Color.element
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical, 60)
                
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
                
                //Подложка (Что бы нельзя было играть при открытом меню)
                if showMenu {
                    Color.white
                        .opacity(0.01)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showMenu.toggle()
                            }
                        }
                }
            }
            //Scaling and moving the view
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                BurgerButton(showMenu: $showMenu)
                    .padding(.top, -5)
                , alignment: .topLeading)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(selectedTab: "Game", showMenu: true)
    }
}
