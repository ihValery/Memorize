//
//  SignOutButton.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct SignOutButton: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                isPresented = true
            }, label: {
                HStack {
                    Image(systemName: "rectangle.lefthalf.inset.fill.arrow.left")
                    Text("Выйти")
                        .fontWeight(.semibold)
                }
            })
            Text("Версия 4.20")
                .fontWeight(.semibold)
                .opacity(0.4)
        }
        .foregroundColor(.colorTextNewGame)
//        .foregroundColor(.white)
        .font(.subheadline)
        .alert(isPresented: $isPresented) {
            Alert(title: Text("Вы уверенны что хотите выйти?"), primaryButton: .cancel(Text("Нет")), secondaryButton: .default(Text("Да")))
        }
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
            .preferredColorScheme(.dark)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}
