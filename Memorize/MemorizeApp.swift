//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI
import Firebase

@main
struct MemorizeApp: App {
    @StateObject var authenticator = Authenticator()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SideMenuMainView()
                .environmentObject(authenticator)
                .onAppear {
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            authenticator.needsAuthentication = false
                        }
                    }
                }
        }
    }
}
