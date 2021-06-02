//
//  ProFile.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct ProFile: View {
    @EnvironmentObject var authenticator: Authenticator
    
    var body: some View {
        VStack(alignment: .leading, spacing: -2) {
            Image(authenticator.needsAuthentication ? "noAvatar" : "proFiler2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .top)
                .cornerRadius(10)
                .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: -5) {
                Text(authenticator.needsAuthentication ? "Пользователь" : "Аппалония")
                    .font(.title)
                    .fontWeight(.bold)
                Text(authenticator.needsAuthentication ? "user@mail.net" : "first@google.com")
            }
        }
        .foregroundColor(.colorTextNewGame)
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFile()
            .environmentObject(Authenticator())
    }
}
