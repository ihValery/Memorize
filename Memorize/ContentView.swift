//
//  ContentView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct ContentView: View {
    //Свойство var с именем body и ТИПОМ some View ещё интересна тем, является вычисляемой (computed)
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 13.0).stroke()
            Text("👻")
        }).padding()
    }
}

//Обеспечивает связь между кодом, и областью справа, которая называется Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
