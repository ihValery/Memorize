//
//  ViewExtension.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

extension View {
   ///iPhone с челкой?
   var withBangs: Bool {
      UIScreen.main.bounds.height > 750
   }
   
   ///Получаем размер экрана
   func getRect() -> CGRect {
      UIScreen.main.bounds
   }
}
