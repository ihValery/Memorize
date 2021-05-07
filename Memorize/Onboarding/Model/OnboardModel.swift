//
//  OnboardModel.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct CardOnboard: Identifiable {
    
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
}
