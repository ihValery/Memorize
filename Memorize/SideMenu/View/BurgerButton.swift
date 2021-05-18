//
//  BurgerButton.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct BurgerButton: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                showMenu.toggle()
            }
        }, label: {
            //animate Drawing Button
            VStack(spacing: 5) {
                Capsule()
                    .fill(showMenu ? Color.colorTextNewGame : themeApp.color)
                    .frame(width: 30, height: 3)
                    //Rotating
                    .rotationEffect(.init(degrees: showMenu ? -45 : 0))
                    .offset(x: showMenu ? 2.5 : 0, y: showMenu ? 9 : 0)
                VStack(spacing: 5) {
                    Capsule()
                        .fill(showMenu ? Color.colorTextNewGame : themeApp.color)
                        .frame(width: 30, height: 3)
                    //Moving Up when clicked
                    Capsule()
                        .fill(showMenu ? Color.colorTextNewGame : themeApp.color)
                        .frame(width: 30, height: 3)
                        .offset(y: showMenu ? -8 : 0)
                }
                .rotationEffect(.init(degrees: showMenu ? 45 : 0))
            }
        })
        .padding()
    }
}

struct BurgerButton_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(selectedTab: "Help", showMenu: true)
    }
}
