//
//  BubbleBlowerAnimation.swift
//  SwiftUI_Firebase
//
//  Created by Валерий Игнатьев on 29.05.21.
//

import SwiftUI

struct BubbleBlowerAnimation: View {
    @State private var startAnimation: Bool = false
    var color: Color
    var positionY: CGFloat
    var frameCircle: ClosedRange<CGFloat>
    
    var body: some View {
        ZStack {
            ForEach(3...7, id: \.self) { _ in
                Circle()
                    .fill(color)
                    .opacity(.random(in: 0.3...0.4))
                    .frame(width: .random(in: frameCircle), height: .random(in: frameCircle))
                    .position(x: startAnimation ? .random(in: 0...getRect().width) : .random(in: 0...getRect().width),
                              y: startAnimation ? .random(in: 0...positionY) : .random(in: 0...positionY))
//                    .animation(.linear(duration: 40).repeatCount(100, autoreverses: true))
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 40).repeatCount(100, autoreverses: true)) {
                startAnimation.toggle()
            }
        }
    }
}

struct BackgroundAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BubbleBlowerAnimation(color: Color.red, positionY: UIScreen.main.bounds.height, frameCircle: 120...420)
    }
}
