//
//  ProFile.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct ProFile: View {
    @ObservedObject var session: SessionFirebase
    
    var body: some View {  
        VStack(alignment: .leading, spacing: -2) {
            ImageWithURL(session.user?.avatarURL ?? "")
                .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: -5) {
                Text(session.user?.userName ?? "Без имени")
                    .font(.title)
                    .fontWeight(.bold)
                Text(session.user?.email ?? "игрок@mail.net")
                    .font(.subheadline)
                    .opacity(0.8)
            }
        }
        .foregroundColor(.colorTextNewGame)
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFile(session: SessionFirebase())
    }
}
