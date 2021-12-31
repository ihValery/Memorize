//
//  MatteEffectView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct MatteEffectView: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    var effect: UIVisualEffect {
        UIBlurEffect(style: colorScheme == .dark ? .systemUltraThinMaterialDark : .systemUltraThinMaterialLight)
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}
