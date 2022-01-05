//
//  ProFileView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

//MARK: ProFileView

struct ProFileView: View {
    
    //MARK: Properties
    
    @ObservedObject var session: SessionFirebase
    
    private let userAvatar: String
    private let userName: String
    private let userEmail: String
    
    private var sizeImage: CGFloat {
        isWithBangs ? 180 : 160
    }
    
    //MARK: Initializer

    init(session: SessionFirebase) {
        self.session = session
        userAvatar = session.user?.avatarURL ?? ""
        userName = session.user?.userName ?? "Без имени"
        userEmail = session.user?.email ?? "игрок@mail.net"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageWithURLView(userAvatar, size: sizeImage)
                .padding(.top, 30)
            
            VStack(alignment: .leading) {
                Text(userName)
                    .font(.title)
                    .fontWeight(.bold)
                Text(userEmail)
                    .font(.subheadline)
                    .opacity(0.8)
            }
        }
        .foregroundColor(.defaultText)
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFileView(session: SessionFirebase())
            .preferredColorScheme(.dark)
    }
}
