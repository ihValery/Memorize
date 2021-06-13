//
//  Header.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct Header: View {
    @ObservedObject var session: SessionFirebase
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Spacer()
                    Text(session.user?.userName ?? "Нет игрока")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.leading).padding()
                }

                Spacer()
            }
            .zIndex(1)
            
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    ImageWithURL(session.user?.avatarURL ?? "", size: 120)
                        .clipShape(CustomCorners(corner: .bottomRight, radius: 35))
                        .padding().padding(.trailing)
                }
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(session: SessionFirebase())
            .preferredColorScheme(.dark)
    }
}
