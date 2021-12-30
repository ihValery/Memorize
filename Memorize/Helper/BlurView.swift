//
//  BlurView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
//    @Environment(\.colorScheme) var colorScheme
    
    var style: UIBlurEffect.Style
//    {
//        colorScheme == .dark ? .systemUltraThinMaterialDark : .systemUltraThinMaterialLight
//    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

//struct BlurViewDark: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
//        return view
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}

struct VisualEffect2View: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}
