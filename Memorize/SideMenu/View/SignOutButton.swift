//
//  SignOutButton.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct SignOutButton: View {
    @State private var isSignOut = false
    @ObservedObject var session: SessionFirebase
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                if session.user != nil {
                    isSignOut = true
                } else {
                    session.isSignIn = true
                }
            } label: {
                HStack {
                    Image(systemName: "rectangle.lefthalf.inset.fill.arrow.left")
                        .rotationEffect(.degrees(session.user != nil ? 0 : 180))
                    Text(session.user != nil ? "Выйти" : "Войти" )
                        .fontWeight(.semibold)
                        .font(.body)
                }
            }
            Text("Версия 4.20")
                .fontWeight(.semibold)
                .font(.footnote)
                .opacity(0.3)
                .padding(.bottom)
        }
        .foregroundColor(.colorTextNewGame)
        
        .fullScreenCover(isPresented: $session.isSignIn) {
            SignMainView(session: session)
        }
        
        .alert(isPresented: $isSignOut) {
            Alert(title: Text("Вы уверенны что хотите выйти?"), primaryButton: .cancel(Text("Нет")),
                  secondaryButton: .default(Text("Да")) {
                    session.sighOut()
                  })
        }
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton(session: SessionFirebase())
            .preferredColorScheme(.dark)
    }
}
