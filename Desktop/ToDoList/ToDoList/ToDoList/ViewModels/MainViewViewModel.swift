//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//
import FirebaseAuth
import Foundation
class MainViewViewModel: ObservableObject{
    
    @Published var currentUserId:String = ""
    private var  handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {   [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                
            }
            
        }

    }
    public var isSignedIn:Bool {
        return Auth.auth().currentUser != nil
    }
    
}
