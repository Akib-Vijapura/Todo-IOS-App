//
//  LoginViewViewModel.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMessage : String = ""
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        
        errorMessage  = ""
        
        guard !email.trimmingCharacters(in : .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            
            errorMessage = "Please enter valid email."
            
            return false
        }
        
        return true
        
    }
}
