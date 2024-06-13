//
//  ToDoListItemViewViewModel.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel : ObservableObject {
    init(){
        
    }
    
    
    func toggleCheckmark(item : ToDoListItem){
        var itemCopy = item
        
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
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
