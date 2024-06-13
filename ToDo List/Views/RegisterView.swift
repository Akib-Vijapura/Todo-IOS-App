//
//  RegisterView.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import SwiftUI

struct RegisterView: View {
    
   @StateObject var ViewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //Hearder
            HeaderView(
                title: "Register",
                subtitle: "Start organizing todos",
                color: .green
            )
            
            // Register form
            
            Form{
                
                if !ViewModel.errorMessage.isEmpty{
                    Text(ViewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Enter your name" , text: $ViewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top , 10)
                    .autocorrectionDisabled()
                
                TextField("Enter your email" , text : $ViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top , 10)
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                SecureField("Password" , text : $ViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top , 10)
                
                    Button{
                        ViewModel.register()
                    }label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                            Text("Register")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
