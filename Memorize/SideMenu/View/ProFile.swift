//
//  ProFile.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct ProFile: View {
    
    var body: some View {
        VStack(spacing: -2) {
            Image("noAvatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .top)
                .cornerRadius(10)
                .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: -5) {
                Text("Апполония")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Сицилийская")
            }
        }
        .foregroundColor(.colorTextNewGame)
        
        
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFile()
    }
}
