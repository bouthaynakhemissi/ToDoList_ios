//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var islogged = false
    init(){}
    func login() {
        print("isCalled")
        guard validate() else {
            return
        }
        // Ajouter ici la logique pour continuer l'authentification si `validate()` réussit
        Auth.auth().signIn(withEmail: email, password:  password)
        islogged = true
    }
    
    private func validate() -> Bool {
        errorMessage = "" // Réinitialiser le message d'erreur
        
        // Vérifier que les champs ne sont pas vides
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // Ajoutez d'autres validations ici si nécessaire, par exemple, vérifier le format de l'email
        
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        return true
    }
}
