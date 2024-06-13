//
//  NewItemViewViewModel.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject {
    
    @Published var title : String = ""
    @Published var dueDate = Date()
    @Published var showAlert : Bool = false
    @Published var errorMessage : String = ""
    
    init(){
        
    }
    
    func save(){
/*       print("save button clicked")
          guard canSave else{
              return
         }
      print("after save")
 */
        
        //get current user id
        
        guard let userID = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create Model
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        //Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
    }
    
    var canSave : Bool {
        errorMessage = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please add title."
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Please set valid date."
            return false
        }
        
        return false
    }
}
