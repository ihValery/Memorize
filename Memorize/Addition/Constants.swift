//
//  Constants.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//

import UIKit

struct Constants {
    static let cornerRadius: CGFloat = 13
    static let edgeLineWidth: CGFloat = 3
    
    static func fontSize(for size: CGSize) -> CGFloat {
        min(size.height, size.width) * 0.75
    }
}
