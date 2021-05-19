//
//  ButtonSetNotification.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import SwiftUI

struct ButtonSetNotification: View {
    @Binding var date: Date
    @State private var setAlarm = false
    @State private var dateString = "00:00"
    
    var body: some View {
            Button(action: {
                dateString = dateToString(date)
                NotificationManager.shared.sceduleNotification(date: date)
                withAnimation(.easeOut(duration: 1)) {
                    setAlarm = true
                }
            }) {
                HStack {
                    Text(setAlarm == false ? "Установить" : "Вкл:  \(dateString)")
                        .padding(.horizontal)
                    Image(systemName: "timer")
                }
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 30)
                .font(.title.weight(.light))
                .padding(7)
                .foregroundColor(setAlarm == false ? .blue : .black.opacity(0.7))
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(setAlarm == false ? Color.blue : Color.black.opacity(0.7), lineWidth: 3))
            }.disabled(setAlarm == true ? true : false)

        if setAlarm {
            ButtonRemoveAlarm(setAlarm: $setAlarm)
        }
    }
    
    private func dateToString(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        return timeFormatter.string(from: date)
    }
}

struct ButtonSetNotification_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .previewLayout(.sizeThatFits)
    }
}
