//
//  SignOutButton.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI
import Firebase

struct SignOutButton: View {
    @State private var isPresented = false
    @State private var showSign = false
    @EnvironmentObject var authenticator: Authenticator
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                if authenticator.needsAuthentication {
                    showSign = true
                } else {
                    isPresented = true
                }
            } label: {
                HStack {
                    Image(systemName: "rectangle.lefthalf.inset.fill.arrow.left")
                        .rotationEffect(.degrees(authenticator.needsAuthentication ? 180 : 0))
                    Text(authenticator.needsAuthentication ? "Войти" : "Выйти")
                        .fontWeight(.semibold)
                        .font(.body)
                }
            }
            Text("Версия 4.20")
                .fontWeight(.semibold)
                .font(.footnote)
                .opacity(0.3)
        }
        .foregroundColor(.colorTextNewGame)
//        .foregroundColor(.white)

        .fullScreenCover(isPresented: $showSign) {
            SignMainView()
        }

        .alert(isPresented: $isPresented) {
            Alert(title: Text("Вы уверенны что хотите выйти?"), primaryButton: .cancel(Text("Нет")),
                  secondaryButton: .default(Text("Да")) {
                    authenticator.logout()
                    print("Мы вышли")
                  })
        }
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
            .environmentObject(Authenticator())
            .preferredColorScheme(.dark)
    }
}
