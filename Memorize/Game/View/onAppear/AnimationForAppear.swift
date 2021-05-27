//
//  AnimationForAppear.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 27.05.21.
//

import SwiftUI

struct AnimationForAppear: View {
    @State private var expand = true
    @ObservedObject var theme = ThemeSettings.shared
    var color: Color
    
    var body: some View {
        themeData[theme.current].color
            .ignoresSafeArea()
        Circle()
            .fill(color)
            .scaleEffect(expand ? 0 : 3)
            .edgesIgnoringSafeArea(.all)
            .animation(.easeIn(duration: 1))
            
            .onAppear {
                expand = false
            }
    }
}

struct AnimationForAppear_Previews: PreviewProvider {
    static var previews: some View {
        AnimationForAppear(color: .green)
    }
}
