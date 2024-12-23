//
//  SplashScreenView.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/12/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                // Main content goes here (e.g., HomeView or any main screen)
                RegisterView()
            } else {
                // Lottie splash screen
                LottieView(animationURL: "https://lottie.host/958c5a53-ec82-414b-b044-a9fd9086e871/HhNwA5Ne22.json", loopMode: .loop)
                    .frame(width: .infinity, height: .infinity)
            }
        }.background(Color(red: 0.7, green: 0.9, blue: 0.7))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                withAnimation {
                    isActive = true
                    
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
