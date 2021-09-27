//
//  View.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

extension View {
    ///Для получения размера экрана
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }
    
    ///iPhone с челкой?
    func withBangs() -> Bool {
        UIScreen.main.bounds.height > 750
    }
}
