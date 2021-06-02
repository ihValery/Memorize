//
//  SideMenuMainView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI
import Firebase

struct SideMenuMainView: View {
    @State var selectedTab = "Новая игра"
    @State var showMenu = false
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var theme = ThemeSettings.shared
    @EnvironmentObject var authenticator: Authenticator
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [.purpleTheme.opacity(colorScheme == .dark ? 0.5 : 1),
                                              themeData[theme.current].color]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            //Боковое меню
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                SideMenu(selectedTab: $selectedTab, showMenu: $showMenu)
            }
            
            ZStack {
                ZStack {
                    TwoBackgroundCard(showMenu: $showMenu)
                    
                    Home(selectedTab: $selectedTab)
                        .cornerRadius(showMenu ? 15 : 0)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
                }
                .rotation3DEffect(.degrees(showMenu ? 20 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
                
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
            //Масштабирование и перемещение вида
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                BurgerButton(showMenu: $showMenu)
                    .padding(.top, -3)
                , alignment: .topLeading)
        }
                
        .sheet(isPresented: $authenticator.showOnboard) {
            OnboardingView()
            //Кажется, эта проблема была недавно исправлена ​​- мне удалось удалить эту строку, и весь проект продолжал работать.
            //Но я еще не нашел никакой документации о том, когда объекты среды автоматически передаются в общий доступ
                .environmentObject(authenticator)
        }
        
        .onAppear {
            print("загрузились")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(selectedTab: "Правила", showMenu: true)
    }
}
