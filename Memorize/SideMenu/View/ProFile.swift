//
//  ProFile.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct ProFile: View {
    @State private var showSign = false
    
    var body: some View {
        VStack(spacing: -2) {
            Image("proFiler2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .top)
                .cornerRadius(10)
            //Padding top for Top Close Button
                .padding(.top, 30)
                .onLongPressGesture {
                    showSign = true
                }
            VStack(alignment: .leading, spacing: -5) {
                Text("Апполония")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Сицилийская")
            }
        }
        .foregroundColor(.colorTextNewGame)
//        .foregroundColor(.black)
        .fullScreenCover(isPresented: $showSign, content: {
            SignMainView()
        })
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFile()
    }
}
