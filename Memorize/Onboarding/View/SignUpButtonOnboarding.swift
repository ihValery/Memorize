//
//  SignUpButtonOnboarding.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.06.21.
//

import SwiftUI

struct SignUpButtonOnboarding: View {
    @State private var showSign = false
    var color: Color
    
    var body: some View {
        Button(action: {
            showSign.toggle()
        }) {
            Text("Представиться")
                .foregroundColor(color)
            .font(.title.weight(.light))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 300, height: 42)
            .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white))
        }
        
        .fullScreenCover(isPresented: $showSign, content: {
            SignMainView()
        })
    }
}

struct SignUpButtonOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButtonOnboarding(color: .red)
    }
}
