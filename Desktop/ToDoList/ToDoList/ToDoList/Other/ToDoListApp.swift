//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//
import Firebase
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
      
            FirebaseApp.configure()
        
    }
   
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
            //RegisterView()
        }
    }
}
