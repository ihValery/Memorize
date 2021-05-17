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
    
    var body: some View {
        //Боковое меню
        VStack(alignment: .leading, spacing: 15) {
            
            //Profile
            Image("profile2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70, alignment: .top)
                .cornerRadius(10)
                
            //Padding top for Top Close Button
                .padding(.top, 50)
            VStack(alignment: .leading, spacing: 6) {
                Text("Monika Lonskiy")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Button(action: {}) {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .opacity(0.7)
                }
            }
            .foregroundColor(.white)
            
            //tab Buttons
            VStack(alignment: .leading, spacing: 10) {
                TabButton(image: "gamecontroller", title: "Game", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "clock.arrow.circlepath", title: "Scope", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "bell.badge", title: "Notification", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "gearshape", title: "Settings", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            //SignOut button
            VStack(alignment: .leading, spacing: -10) {
                TabButton(image: "rectangle.lefthalf.inset.fill.arrow.left", title: "Sing Out", selectedTab: .constant(""), animation: animation)
                    .padding(.horizontal, -15)
                Text("App version 3.4.20")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.4)
            }
            .padding(.bottom, 35)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(selectedTab: "Game", showMenu: true)
    }
}
