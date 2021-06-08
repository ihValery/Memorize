//
//  SignOutButton.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct SignOutButton: View {
    @State private var isPresented = false
    @State private var showSign = false
    
    @ObservedObject var session: SessionFirebase
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                if session.user != nil {
                    isPresented = true
                } else {
                    showSign = true
                }
            } label: {
                HStack {
                    Image(systemName: "rectangle.lefthalf.inset.fill.arrow.left")
                        .rotationEffect(.degrees(180))
                    Text(session.user != nil ? "Выйти" : "Войти" )
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
        
        .fullScreenCover(isPresented: $showSign) {
            SignMainView(session: session)
        }
        
        .alert(isPresented: $isPresented) {
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
