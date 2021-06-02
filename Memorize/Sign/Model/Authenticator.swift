//
//  Authenticator.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.06.21.
//

import Foundation
import Combine
import Firebase

class Authenticator: ObservableObject {
    @Published var needsAuthentication: Bool
    @Published var showOnboard: Bool
    
    init() {
        self.needsAuthentication = true
        self.showOnboard = true
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if error != nil {
                print(error?.localizedDescription ?? "Хьюстон у нас проблемы")
                return
            }
            if user != nil {
                self?.needsAuthentication = false
            }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if error == nil {
                if user != nil {
                    self?.needsAuthentication = false
                }
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        needsAuthentication = true
    }
}
