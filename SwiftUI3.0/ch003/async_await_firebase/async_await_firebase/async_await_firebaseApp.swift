//
//  async_await_firebaseApp.swift
//  async_await_firebase
//
//  Created by 蔡志文 on 2022/4/24.
//

import SwiftUI
import Firebase

@main
struct async_await_firebaseApp: App {
   
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
