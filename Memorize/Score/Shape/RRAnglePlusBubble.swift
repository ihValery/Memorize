//
//  RRAnglePlusBubble.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 29.06.21.
//

import SwiftUI

struct RRAnglePlusBubble: View {
    @ObservedObject var theme = ThemeSettings.shared
    
    var body: some View {
        ZStack {
            RectangleReverseAngle(startY: 165)
                .fill(Color.white)
            RectangleReverseAngle(startY: 165)
                .fill(LinearGradient(gradient: Gradient(colors: [themeData[theme.current].color.opacity(0.6), .purpleTheme]), startPoint: .topTrailing, endPoint: .bottomLeading))
            BubbleBlower(color: themeData[theme.current].color, positionY: 250, frameCircle: 50...200)
                .clipShape(RectangleReverseAngle(startY: 165))
        }
//        .drawingGroup()
    }
}

struct RRAnglePlusBubble_Previews: PreviewProvider {
    static var previews: some View {
        RRAnglePlusBubble()
    }
}
