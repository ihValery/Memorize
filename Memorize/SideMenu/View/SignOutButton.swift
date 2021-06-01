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
                        .font(.body)
                }
            })
            Text("Версия 4.20")
                .fontWeight(.semibold)
                .font(.footnote)
                .opacity(0.3)
        }
        .foregroundColor(.colorTextNewGame)
//        .foregroundColor(.white)

        .alert(isPresented: $isPresented) {
            Alert(title: Text("Вы уверенны что хотите выйти?"), primaryButton: .cancel(Text("Нет")), secondaryButton: .default(Text("Да")))
        }
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
            .preferredColorScheme(.dark)
    }
}
