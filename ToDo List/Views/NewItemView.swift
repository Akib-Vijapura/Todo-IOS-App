//
//  NewItemView.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var ViewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack{
            Text("New Todo")
                .font(.system(size : 32))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top , 50)
            
            Form{
                
                if !ViewModel.errorMessage.isEmpty{
                    Text(ViewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                //Add title
                TextField("Add title" , text : $ViewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date" ,
                           selection : $ViewModel.dueDate)
                .datePickerStyle(GraphicalDatePickerStyle())
                
                //Create Button
                //Bug tobe fixed....
                Button{
//                    if ViewModel.canSave{
                        ViewModel.save()
                        newItemPresented = false
//                    }else{
//                        ViewModel.showAlert = true
//                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                        Text("Save")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
            }
//            .alert(isPresented: $ViewModel.showAlert ){
//                Alert(title : Text("Error") , message: Text("Please fill all fileds and due date should be greater than older date"))
//            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
