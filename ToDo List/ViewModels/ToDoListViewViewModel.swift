//
//  ToDoListViewViewModel.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView : Bool = false
    private let userId : String
    
    init(userId : String){
        self.userId  = userId
    }
    
    
    /// Delete todo list item by id
    /// - Parameter id: item id to delete
    func delete (id : String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
