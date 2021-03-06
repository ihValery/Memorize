//
//  SignMainView.swift
//  CombineFirebase
//
//  Created by Валерий Игнатьев on 29.05.21.
//

import SwiftUI
import Firebase

struct SignMainView: View {
    
    //MARK: - Properties
    @ObservedObject var session: SessionFirebase

    @State private var signInSelected = false
    
    @ObservedObject private var signViewModel = SignViewModel.shared
    
    @Environment (\.presentationMode) private var presentationMode
    
    //MARK: - Body

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.signStart, .signEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            BubbleBlowerView(color: Color.red, positionY: getScreeSize().height, frameCircle: 120...420)
                .drawingGroup()
                .ignoresSafeArea()
            
            VStack {
                SignTopPanelView(signInSelected: $signInSelected)
                
                GeometryReader { gr in
                    ScrollView(isWithBangs ? .init() : .vertical, showsIndicators: false) {
                        VStack {
                            BackgroundCardSignView(height: 365, session)
                                .overlay(AnketaSignUpView().padding())
                                .offset(y: gr.size.height / 4.5)
                                .offset(x: signInSelected ? 0 : gr.size.width + 50)
                            
                            Button(self.signViewModel.isValidSignUp ? "Зарегистрироваться" : "Заполните все поля") {
                                session.signUp(email: signViewModel.email, password: signViewModel.password, name: signViewModel.username, photo: signViewModel.image)
                            }
                            .buttonStyle(SignButtonStyle(colorBG: .white, colorText: signViewModel.isValidSignUp ? .signEnd : .gray))
                            .offset(y: signInSelected ? 190 : gr.size.height + 50)
                            .disabled(!signViewModel.isValidSignUp)
                        }
                        .padding(.bottom, isWithBangs ? 0 : 300)
                    }
                    
                    VStack {
                        Spacer()
                        
                        BackgroundCardSignView(height: 190, session)
                            .overlay(AnketaSignInView()
                                        .padding()
                                        .padding(.bottom, -20))
                            .offset(x: !signInSelected ? 0 : -gr.size.width - 50)
                            .padding(.bottom, 70)
                        
                        Button(signViewModel.isValidSignIn ? "Войти" : "Заполните все поля") {
                            session.signIn(email: signViewModel.email, password: signViewModel.passwordSignIn)
                        }
                        .buttonStyle(SignButtonStyle(colorBG: .white,
                                                     colorText: signViewModel.isValidSignIn ? .signEnd : .gray))
                        .offset(y: !signInSelected ? 0 : gr.size.height + 150)
                        .disabled(!signViewModel.isValidSignIn)
                        
                        Spacer()
                    }
                }
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
