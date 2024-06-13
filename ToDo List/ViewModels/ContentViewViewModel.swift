//
//  ContentViewViewModel.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import Foundation
import FirebaseAuth

class ContentViewViewModel : ObservableObject {
    @Published var currentUserId : String = ""
    private var  handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
     var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
