//
//  Theme.swift
//  ThemeAplication
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct Theme: Identifiable {
    var id: Int
    var name: String
    var avatar: String
    
    var level: Int
    var levelFloat: CGFloat {
        CGFloat(level) / 10.0
    }
    
    var timer: CGFloat
    
    var age: Int
    var ageFloat: CGFloat {
        CGFloat(age) / 18.0
    }
    var color: Color
    
    var number: Int
    var collection: [String]
}
