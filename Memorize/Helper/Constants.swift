//
//  Constants.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//

import SwiftUI

///Размер текста зависящий от ширины или высоты помноженное на 0.7
func fontSize(for size: CGSize) -> CGFloat {
    min(size.height, size.width) * 0.7
}

