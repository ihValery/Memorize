//
//  IconDescription.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct IconDescription: View {
    var icon: IconDesc
    var theme: Theme
    var parametr: CGFloat
    var selectedTheme: Int
    
    var body: some View {
        Image("\(icon)")
            .resizable()
            .frame(width: withBangs() ? 28 : 20, height: withBangs() ? 28 : 20)
            .padding()
            .background(
                ZStack {
                    theme.color
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: parametr)
                        .stroke(Color.white, lineWidth: 5)
                }
                .rotationEffect(
                    .degrees(selectedTheme == theme.id ? 270 : -90))
            )
            .clipShape(Circle())
    }
}

struct iconInDescription_Previews: PreviewProvider {
    static var previews: some View {
        IconDescription(icon: .age, theme: themeData.first!, parametr: 0.5, selectedTheme: 1)
            .preferredColorScheme(.dark)
//            .previewLayout(.sizeThatFits)
    }
}

enum IconDesc {
    case age
    case timer
    case level
}

//struct OpaOpa {
//    var icon: IconDesc
//    var theme: Theme
//
//    var parametr: CGFloat {
//        switch icon {
//        case .age:
//            return theme.ageFloat
//        case .timer:
//            return theme.timer
//        case .level:
//            return theme.levelFloat
//        }
//    }
//}
