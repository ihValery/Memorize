//
//  FontExtension.swift.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 31.12.2021.
//

import SwiftUI

/*
 static: Значения этих свойст едины для всех экземпляров данного типа.
 Определяет методы, вызываемые для самого типа.
 Дочитать почему в ViewExtension я не использую static, а тут без него не работает
 */

extension Font {
    ///Размер Эмодзи зависящий от ширины или высоты ячеки помноженное на коэффициент
    static func sizeEmoji(for size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * 0.7)
    }
}
