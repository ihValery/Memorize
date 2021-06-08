//
//  SignMainView.swift
//  CombineFirebase
//
//  Created by Валерий Игнатьев on 29.05.21.
//

import SwiftUI
import Firebase

struct SignMainView: View {
    @ObservedObject private var signViewModel = SignViewModel.shared
    @Environment (\.presentationMode) var presentationSign
    @State private var signInSelected = false
    
//    @Binding var image: UIImage
    @ObservedObject var session: SessionFirebase
    
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
                        BackgroundCardSign(height: 365)
                            .overlay(AnketaSignUp().padding())
                            .offset(y: gr.size.height / 4.5)
                            .offset(x: signInSelected ? 0 : gr.size.width + 50)
                        
                        Button(self.signViewModel.isValidSignUp ? "Зарегистрироваться" : "Заполните все поля") {
                            session.signUp(email: signViewModel.email, password: signViewModel.password, name: signViewModel.username, photo: signViewModel.image)
                            
                            presentationSign.wrappedValue.dismiss()
                        }
                        .buttonStyle(SignStyleButton(colorBG: .white,
                                                     colorText: signViewModel.isValidSignUp ? .orangeGradientEnd : .gray))
                        .offset(y: signInSelected ? 190 : gr.size.height + 50)
                        .disabled(!signViewModel.isValidSignUp)
                    }
                    
                    VStack {
                        BackgroundCardSign(height: 190)
                            .overlay(AnketaSignIn().padding().padding(.bottom, -20))
                            .offset(y: gr.size.height / 3.5)
                            .offset(x: !signInSelected ? 0 : -gr.size.width - 50)
                        
                        Button(signViewModel.isValidSignIn ? "Войти" : "Заполните все поля") {
                            session.signIn(email: signViewModel.email, password: signViewModel.passwordSignIn)
                            
                            presentationSign.wrappedValue.dismiss()
                        }
                        .buttonStyle(SignStyleButton(colorBG: .white,
                                                     colorText: signViewModel.isValidSignIn ? .orangeGradientEnd : .gray))
                        .offset(y: !signInSelected ? 365 : gr.size.height + 150)
                        .disabled(!signViewModel.isValidSignIn)
                    }
                }
                .animation(.easeInOut)
            }
        }
        
        .onDisappear {
            signViewModel.clearTextFields()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignMainView(session: SessionFirebase())
    }
}
