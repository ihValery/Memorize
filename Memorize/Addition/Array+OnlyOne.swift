//
//  Array+OnlyOne.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.05.21.
//

import Foundation

extension Array {
    var onlyOne: Element? {
        count == 1 ? first : nil
    }
}
