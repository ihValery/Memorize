//
//  BackgroundCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct BackgroundCard: View {
    private let width = UIScreen.main.bounds.width - 20
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.red.opacity(0.4))
//            .fill(Color.white.opacity(0.2))
            .frame(width: width, height: width / 1.7)
    }
}

struct BackgroundCard_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCard()
            .preferredColorScheme(.dark)
    }
}
