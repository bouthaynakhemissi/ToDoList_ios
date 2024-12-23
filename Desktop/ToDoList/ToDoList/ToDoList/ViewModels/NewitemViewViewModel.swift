//
//  NewitemViewViewModel.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewitemViewViewModel:ObservableObject{
    @Published var title  = ""
    @Published var dueDate  = Date()
    @Published var showAlert  = false
    @Published var showingToDoListitem = false 
    init()
    {}
    func save() {
        guard canSave else {return
        }
        //Get current user id
        guard let uId  = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListitem(id:newId,
                                   title:title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   CreatedDate:Date().timeIntervalSince1970,
                                   isDone:false
        )
        
        //Save model
        let db  = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
     
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400)else {
            return false 
        }
        return true
    }
}
