//
//  NotificationView.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var currentDate = Date()
    @State private var toShowAlert = false
//    @State private var textTitle = ""
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [themeApp.color,
                                              .purpleTheme.opacity(colorScheme == .dark ? 0.5 : 1)]),
                            startPoint: .topTrailing, endPoint: .bottomLeading)
                .opacity(0.6)
                .ignoresSafeArea()
            VStack {
                Text("10 минут,\nчто бы мозг работал эффективнее!")
                    .font(.largeTitle)
                    .foregroundColor(.black.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                DatePicker("Время", selection: $currentDate, in: Date()...)
                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .labelsHidden()
                    .environment(\.locale, Locale.init(identifier: "ru"))
                
                ButtonSetNotification(date: $currentDate)
            }
            .font(.largeTitle)
            .padding()
            
            .onChange(of: scenePhase) { phase in
                if phase == .active {
                    UIApplication.shared.applicationIconBadgeNumber = 0
                }
            }
            
            .onAppear {
                NotificationManager.shared.getNotification {
                    toShowAlert.toggle()
                }
            }
            
            .alert(isPresented: $toShowAlert, content: {
                Alert(title: Text("Уведомление отключено для этого приложения"),
                      message: Text("Пожалуйста, перейдите в настройки, чтобы включить его сейчас"),
                      primaryButton: .default(Text("Открыть настройки")) {
                        goToSettings()
                      },
                      secondaryButton: .cancel())
        })
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

extension NotificationView {
    private func goToSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .preferredColorScheme(.light)
    }
}
