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
        VStack(alignment: .leading) {
            ImageWithURL(session.user?.avatarURL ?? "", size: withBangs() ? 180 : 160)
                .padding(.top, 30)
            
            VStack(alignment: .leading) {
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
