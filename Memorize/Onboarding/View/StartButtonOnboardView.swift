//
//  StartButtonOnboardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct StartButtonOnboardView: View {
    //MARK: - Properties
//    @ObservedObject var viewModelGame: EmojiMemoryGame
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    //MARK: - Body
    var body: some View {
        Button(action: {
            print("Всунуть логику")
            self.isOnboarding?.toggle()
        }) {
            HStack(spacing: 8) {
                Text("Skip")
            }
            .font(.title.weight(.light))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }//Button
        .accentColor(.white)
        .frame(width: 300, height: 42)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white, lineWidth: 1.25))
    }
}

struct StartButtonOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonOnboardView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
