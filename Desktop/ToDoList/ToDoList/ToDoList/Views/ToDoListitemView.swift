//
//  ToDoListitemView.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import SwiftUI

struct ToDoListitemView: View {
    @StateObject var viewModel = ToDoListitemViewViewModel()
    let item: ToDoListitem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title )
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated , time:.shortened))")
                    .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
        }
    }
}
            struct ToDoListitemView_Previews: PreviewProvider {
                static var previews: some View {
                    ToDoListitemView(item: .init(
                        id: UUID().uuidString,
                        title: "Get milk",
                        dueDate: Date().timeIntervalSince1970,
                        CreatedDate: Date().timeIntervalSince1970,
                        isDone: true
                    ))
                }
            }
    
