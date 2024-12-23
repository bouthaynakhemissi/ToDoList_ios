import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // header
                HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
                
                Form {
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                TLButton(title: "Create Account", background:.green) {
                    viewModel.register()
                }
                .padding(.bottom, 175)
                .offset(y: -50)
                                // Navigation vers LoginView via un bouton
                NavigationLink("Already have an account? Log in", destination: LoginView())
                    .foregroundColor(.blue)
                
                

            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

