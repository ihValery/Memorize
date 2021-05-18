//
//  Home.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    
    //Hiding tab bar
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        //Tab View with tabs
        TabView(selection: $selectedTab) {
            
            //Views
            EmojiMemoryGameView(viewModelGame: EmojiMemoryGame()).tag("Game")
            Score().tag("Score")
            Settings().tag("Settings")
            NotificationView().tag("Notification")
//            Notifications().tag("Notification")
            OnboardingView().tag("Help")
//            Help().tag("Help")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView()
    }
}

//struct GamePage: View {
//    var body: some View {
//        EmojiMemoryGameView(viewModelGame: EmojiMemoryGame())
//    }
//}

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

struct Settings: View {
    var body: some View {
        NavigationView {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}

//struct Notifications: View {
//    var body: some View {
//        NavigationView {
//            Text("Notification")
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundColor(.primary)
//                .navigationTitle("Notification")
//        }
//    }
//}

struct Help: View {    
    var body: some View {
        NavigationView {
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}
