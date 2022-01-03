//
//  MatteEffectView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct MatteEffectView: UIViewRepresentable {
    
    //MARK: - Properties

    private var effect: UIVisualEffect {
        UIBlurEffect(style: colorScheme == .dark ? .systemUltraThinMaterialDark : .systemUltraThinMaterialLight)
    }

    @Environment(\.colorScheme) private var colorScheme

    //MARK: - Public Methods

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
    
}
