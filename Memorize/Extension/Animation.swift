//
//  Animation.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 22.05.21.
//

import SwiftUI

extension Animation {
    ///Анимация для раздачи карт.
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}
