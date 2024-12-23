//
//  LoginView.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import SwiftUI
struct LoginView: View {
    @StateObject var viewModel=LoginViewViewModel()
    @State private var showHomeScreen = false
    var body: some View {
        NavigationView{   
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password",text:$viewModel.password)
                    
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log In", background:.blue)
                                {
                                    viewModel.login()
                                  //  if
                    }
                    .padding()
                }
                .offset(y: -50)
               
                
                //Create Account
                VStack{
                    Text("New around here")
                    
                    NavigationLink("Create An Account" , destination :  RegisterView())
                }
                .padding(.bottom,50)
                Spacer()
                    .fullScreenCover(isPresented: $viewModel.islogged) {
                        ToDoListView(userId: "3ANZuyqZH6PwcPCFVQoK7Xq2Jyz2")
                    }
                 
            }
        }
    }
}

struct LoginView_Previews:  PreviewProvider{
    static var previews: some View{
    LoginView()
}
}
