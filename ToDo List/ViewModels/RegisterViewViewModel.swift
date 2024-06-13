//
//  RegisterViewViewModel.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var password : String  = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){[weak self]result , error in
            
            guard let userID : String = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
        
    }
    
    func insertUserRecord(id : String){
        let newUser = User(id : id , 
                           name : name ,
                           email : email ,
                           joined : Date().timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty && !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill all fileds."
            return false;
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be greater then 6"
            return false
        }
        
        return true
    }
}
