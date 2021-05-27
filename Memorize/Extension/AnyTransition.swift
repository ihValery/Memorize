//
//  AnyTransition.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.05.21.
//

import SwiftUI

extension AnyTransition {
    ///Перезапись появления и исчезновения анимации
    static var animationForAlarm: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: opacity)
            .combined(with: .scale)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: opacity)
            .combined(with: .scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension AnyTransition {

    static func cardTransition(size: CGSize) -> AnyTransition {
        let insertion = AnyTransition.offset(flyFrom (for: size))
        let removal = AnyTransition.offset(flyTo (for: size))
            .combined(with: AnyTransition.scale(scale: 0.5))
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static func flyFrom(for size:CGSize) -> CGSize {
        CGSize(width: 0.0/*CGFloat.random(in: -size.width/2...size.width/2)*/,
               height: 2 * size.height)
    }
    static func flyTo(for size:CGSize) -> CGSize {
        CGSize(width:  CGFloat.random(in: -3*size.width...3*size.width),
               height: CGFloat.random(in: -2*size.height...(-size.height)))
    }
}
