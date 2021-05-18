//
//  ButtonSetNotification.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import SwiftUI

struct ButtonSetNotification: View {
    var date: Date?
    var text: String?
    
    var body: some View {
        Button(action: {
            guard let date = date, let text = text else { return }
            NotificationManager.shared.sceduleNotification(notificationType: text, date: date)
        }) {
            HStack {
                Text("Установить")
                    .padding(.horizontal)
                Image(systemName: "timer")
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 30)
            //            .foregroundColor(themeApp.color)
            .font(.title.weight(.light))
            .padding(7)
//            .background(themeApp.color)
//            .cornerRadius(25)
            .foregroundColor(.blue)
            .shadow(color: .black, radius: 0.1)
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 3))
        }
    }
}

struct ButtonSetNotification_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSetNotification()
            .previewLayout(.sizeThatFits)
    }
}
