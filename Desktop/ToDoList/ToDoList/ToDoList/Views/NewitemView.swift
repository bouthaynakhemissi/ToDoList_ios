//
//  NewitemView.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewitemViewViewModel()
    @Binding var newItemPresented: Bool 
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                //Title
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date" , selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save ", background: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false }
                    else{
                        
                        viewModel.showAlert = true 
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error ") , message: Text("Please fill in all fields and select due date  that is today or newer . "))
            }
            
            }
            
        }
    }


struct NewItemView_Previews:  PreviewProvider{
    static var previews: some View {
        NewitemView(newItemPresented: Binding(
                get: {
                    return true
                },
                set: { _ in
                    // No-op, set behavior if needed
                }
            ))
    }
}

