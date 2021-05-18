//
//  ButtonSetNotification.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import SwiftUI

struct ButtonSetNotification: View {
    var date: Date?
    @State var showText = false
    
    var body: some View {
        ZStack {
            
            Button(action: {
                guard let date = date else { return }
                NotificationManager.shared.sceduleNotification(date: date)
                withAnimation(.easeOut(duration: 1)) {
                    showText = true
                }
            }) {
                HStack {
                    Text(showText == false ? "Установить" : "Установленно")
                        .padding(.horizontal)
                    Image(systemName: "timer")
                }
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 30)
                .font(.title.weight(.light))
                .padding(7)
                .foregroundColor(showText == false ? .blue : .black.opacity(0.7))
                .shadow(color: .black, radius: 0.1)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(showText == false ? Color.blue : Color.black.opacity(0.7), lineWidth: 3))
            }
            
        }
        if showText {
            Button(action: {
                withAnimation(.easeOut(duration: 1)) {
                    showText = false
                }
            }, label: { Text("Удалить") })
            .font(.title2)
            .foregroundColor(.red.opacity(0.7))
            .transition(.animationForAlarm)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 30)
            .padding(7)
            .font(.title.weight(.light))
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.red.opacity(0.7), lineWidth: 3))
        }
    }
}

struct ButtonSetNotification_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSetNotification()
            .previewLayout(.sizeThatFits)
    }
}
