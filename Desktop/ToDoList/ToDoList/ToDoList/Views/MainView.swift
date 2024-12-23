//
//  ContentView.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel  = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUser.isEmpty{
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView:some View{
        ToDoListView(userId: viewModel.currentUser)
            .tabItem{
                Label("Home",systemImage: "house")
            }
        ProfileView()
            .tabItem{
                Label("Profile",systemImage: "person.circle")
            }
    }
    
}

struct ContentView_Previews:  PreviewProvider{
    static var previews: some View{
    MainView()
}
}

