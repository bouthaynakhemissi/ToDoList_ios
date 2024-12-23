//
//  ToDoListitemViewViewModel.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

 
    import Foundation
    import FirebaseAuth
    import FirebaseFirestore

    /// ViewModel for single to do list item view (each row in items list)
    class ToDoListitemViewViewModel:ObservableObject {
        init() {}
        
        func toggleIsDone(item: ToDoListitem) {
            var itemCopy = item
            var value = itemCopy.isDone
            itemCopy.setDone(state: !value)
            
            guard let uid = Auth.auth().currentUser?.uid else{
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uid)
                .collection("todos")
                .document(itemCopy.id)
                .setData(itemCopy.asDictionary())
        }
    }

