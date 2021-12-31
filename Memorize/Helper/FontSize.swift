//
//  fontSize.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//

import SwiftUI

extension Font {
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.height, size.width) * 0.7
    }
}
