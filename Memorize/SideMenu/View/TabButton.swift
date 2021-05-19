//
//  TabButton.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    
    //Selected tab
    @Binding var selectedTab: String
    //For Hero Animation Slide
    var animation: Namespace.ID
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) { selectedTab = title }
        }) {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? ThemeFactory.themeApp.color : .colorTextNewGame)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            //max Frame
            .frame(maxWidth: getRect().width - 170, alignment: .leading)
            .background(
                
                //hero Animation
                ZStack {
                    if selectedTab == title {
                        Color.element.opacity(colorScheme == .light ? 1 : 0.5)
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corner: [.topRight, .bottomRight], radius: 12))
                            //Магия )))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(selectedTab: "Новая игра", showMenu: true)
            .preferredColorScheme(.dark)
    }
}
