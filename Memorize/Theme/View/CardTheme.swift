//
//  CardTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct CardTheme: View {
   var theme: Theme
   var selectedTheme: Int
   
   var body: some View {
      HStack {
         VStack {
            Text(theme.avatar)
               .font(.system(size: getRect().width / 2.5))
               .fixedSize()
               .opacity(activeTheme() ? 1 : 0.5)
               .rotationEffect(.degrees(activeTheme() ? 10 : 0))
               .shadow(color: .black.opacity(activeTheme() ? 0.5 : 0),
                       radius: activeTheme() ? 10 : 0,
                       x: 3, y: activeTheme() ? 30 : 0)
         }
         .frame(maxWidth: getRect().width / 2, alignment: .center)
         
         Spacer()
         
         VStack {
            VStack {
               IconDescription(.age(trim: theme.ageFloat), theme, activeTheme())
               HStack {
                  IconDescription(.timer(trim: theme.timer), theme, activeTheme())
                  IconDescription(.level(trim: theme.levelFloat), theme, activeTheme())
               }
            }
            .opacity(activeTheme() ? 1 : 0.3)
            
            TitleCard(theme.name)
               .foregroundColor(activeTheme() ? .white : .black.opacity(0.1))
         }
         .padding(.trailing, 40)
      }
      .frame(maxWidth: .infinity)
      .frame(height: getRect().width / 1.8)
      .background(
         RoundedRectangle(cornerRadius: 25)
            .fill(activeTheme() ? theme.color : .white.opacity(0.4))
      )
      .padding(.horizontal)
      .rotation3DEffect(.degrees(rotationActiveIsMultiple()), axis: (x: 0, y: 1, z: 0))
      .offset(x: offsetActiveIsMultiple())
   }
   
   private func rotationActiveIsMultiple() -> CGFloat {
      guard !activeTheme() else { return 0 }
      
      return theme.id.isMultiple(of: 2) ? -22 : 22
   }
   
   private func offsetActiveIsMultiple() -> CGFloat {
      guard !activeTheme() else { return 0 }
      
      if theme.id.isMultiple(of: 2) {
         return withBangs ? -32 : -22
      } else {
         return withBangs ? 32 : 22
      }
   }
   
   private func activeTheme() -> Bool {
      selectedTheme == theme.id
   }
}

struct CardTheme_Previews: PreviewProvider {
   static var previews: some View {
      CardTheme(theme: themeData.last!, selectedTheme: 0)
         .preferredColorScheme(.dark)
   }
}
