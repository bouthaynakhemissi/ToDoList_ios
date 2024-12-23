//
//  User.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import Foundation
struct User: Codable{
    let id: String
    let name :String
    let email :String
    let joined: TimeInterval
}
