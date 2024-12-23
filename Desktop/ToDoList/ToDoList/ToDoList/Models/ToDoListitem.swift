//
//  ToDoListitem.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import Foundation
struct ToDoListitem : Codable ,Identifiable{
    let id: String
    let title: String
    let dueDate :TimeInterval
    let CreatedDate :TimeInterval
    var isDone :  Bool
    mutating func setDone(state: Bool) {
        isDone = state
    }
    
}
