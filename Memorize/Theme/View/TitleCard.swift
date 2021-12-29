//
//  TitleCard.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct TitleCard: View {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Text(name)
            .font(.title3)
            .bold()
            .fixedSize()
            .lineLimit(1)
            .padding(.top, withBangs ? 15 : 0)
    }
}
