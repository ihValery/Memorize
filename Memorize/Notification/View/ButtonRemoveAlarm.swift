//
//  ButtonRemoveAlarm.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.05.21.
//

import SwiftUI

struct ButtonRemoveAlarm: View {
    @Binding var setAlarm: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 1)) {
                NotificationManager.shared.removeNotification()
                setAlarm = false
            }
        }) {
            Text("Удалить")
        }.contentShape(Rectangle())
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 30)
        .font(.title.weight(.light))
        .padding(7)
        .foregroundColor(.red.opacity(0.7))
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.red.opacity(0.9), lineWidth: 3))
        
        .transition(.animationForAlarm)
    }
}
