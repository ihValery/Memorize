//
//  ContentView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct ContentView: View {
    // Свойство var с именем body и ТИПОМ some View ещё интересна тем, является вычисляемой (computed)
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
        .padding()
        .foregroundColor(.orange)
        // функция font воздействует ТОЛЬКО на ВСЕ Text, входящие в стек ZStack.
        .font(.largeTitle)
    }
}

// Структура для одной карты
struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 13.0)
                    // Есть необязательный аргумент и этим аргументом является цвет Color
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 13.0)
                    // Могут быть другие аргументы, и один из них — ширина линии обводки lineWdth.
                    .stroke(lineWidth: 3.0)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 13.0).fill()
            }
        }
    }
}

// Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
