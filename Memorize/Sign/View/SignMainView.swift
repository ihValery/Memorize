//
//  SignMainView.swift
//  CombineFirebase
//
//  Created by Валерий Игнатьев on 29.05.21.
//

import SwiftUI

struct SignMainView: View {
    @ObservedObject private var signViewModel = SignViewModel.shared
    @Environment (\.presentationMode) var presentationSign
    @State private var signInSelected = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orangeGradientStart, .orangeGradientEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            BackgroundAnimation()
                .drawingGroup()
                .ignoresSafeArea()
            
            VStack {
                HStack(spacing: 1) {
                    SignSelectButton(text: "Вход")
                        .opacity(!signInSelected ? 1 : 0.4)
                        .onTapGesture {
                            signInSelected = false
                        }
                    
                    SignSelectButton(text: "Регистрация")
                        .opacity(signInSelected ? 1 : 0.4)
                        .onTapGesture {
                            signInSelected = true
                        }
                }
                
                GeometryReader { gr in
                    VStack {
                        BackgroundCardSign(height: 320)
                            .overlay(AnketaSignUp().padding())
                            .offset(y: gr.size.height / 4.5)
                            .offset(x: signInSelected ? 0 : gr.size.width + 50)
                        
                        Button(self.signViewModel.isValidSignUp ? "Зарегистрироваться" : "Заполните все поля") {
                            clearTextFields()
                            presentationSign.wrappedValue.dismiss()
//                            signUp()
                            print("--------Зарегистрироваться--------")
                        }
                        .buttonStyle(SignStyleButton(colorBG: .white,
                                                     colorText: signViewModel.isValidSignUp ? .orangeGradientEnd : .gray))
                        .offset(y: signInSelected ? 230 : gr.size.height + 50)
                        .disabled(!signViewModel.isValidSignUp)
                    }
                    
                    VStack {
                        BackgroundCardSign(height: 190)
                            .overlay(AnketaSignIn().padding().padding(.bottom, -20))
                            .offset(y: gr.size.height / 3.5)
                            .offset(x: !signInSelected ? 0 : -gr.size.width - 50)
                        
                        Button(signViewModel.isValidSignIn ? "Войти" : "Заполните все поля") {
                            clearTextFields()
                            presentationSign.wrappedValue.dismiss()
//                            signIn()
                            print("--------Войти--------")
                        }
                        .buttonStyle(SignStyleButton(colorBG: .white,
                                                     colorText: signViewModel.isValidSignIn ? .orangeGradientEnd : .gray))
                        .offset(y: !signInSelected ? 340 : gr.size.height + 150)
                        .disabled(!signViewModel.isValidSignIn)
                    }
                }
                .animation(.easeInOut)
            }
        }
    }
    
    func clearTextFields() {
        signViewModel.username = ""
        signViewModel.email = ""
        signViewModel.passwordSignIn = ""
        signViewModel.password = ""
        signViewModel.passwordAgain = ""
    }
    
//    func signIn() {
//        Auth.auth().signIn(withEmail: signViewModel.email, password: signViewModel.password) { user, error in
//            if error != nil {
//                print(error?.localizedDescription ?? "Хьюстон у нас проблемы")
//                return
//            }
//            if user != nil {
//                presentAlert = true
//                return
//            }
//
//        }
//    }
    
    
//    func signUp() {
//        Auth.auth().createUser(withEmail: signViewModel.email, password: signViewModel.password) { user, error in
//            if error == nil {
//                if user != nil {
//                    presentAlert = true
//
//                }
//            }
//        }
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignMainView()
    }
}
