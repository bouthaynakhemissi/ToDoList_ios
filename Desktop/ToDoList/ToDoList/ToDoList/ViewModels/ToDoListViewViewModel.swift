import Foundation
import FirebaseFirestore
import SwiftUI

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView  = false
    @Published var showingEditItemView = false
    @Published var items: [ToDoListitem] = []
    @Published var errorMessage: String? = nil
    private let userId: String

    init(userId: String) {
        self.userId = userId
        //fetchTodoItems()
    }

       
        
        // Delete to do list Item
        func delete(id: String){
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(id)
                .delete()
            
        }
    }
