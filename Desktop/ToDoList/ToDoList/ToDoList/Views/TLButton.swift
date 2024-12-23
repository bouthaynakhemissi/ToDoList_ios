//
//  TlButton.swift
//  ToDoList
//
//  Created by Tekup-mac-3 on 20/11/2024.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button{
            //Action
            action()
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews:  PreviewProvider{
    static var previews: some View{
        TLButton(title: "Value" , background: .pink ){
            // Action
            
        }
    }
}
