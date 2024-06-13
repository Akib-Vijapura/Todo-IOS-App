//
//  ProfileView.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var ViewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                if let user =  ViewModel.user{
                    profile(user : user)
                }else{
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            ViewModel.fetUser()
        }
    }
    
    @ViewBuilder
    func profile(user : User) ->  some View{
        
        //Avtar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125 , height: 125)
            .padding(.bottom,50)
        
        //Info : Name, Email, Member since
            VStack(alignment: .leading){
                HStack{
                    Text("Name :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(user.name)
                }
                
                HStack{
                    Text("Email :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(user.email)
                }
                .padding(.top,10)
                
                HStack{
                    Text("Member Since :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date : .abbreviated , time: .shortened))")
                }
                .padding(.top,10)
            }

        
        //Logout
        
            Button{
                ViewModel.logout()
            } label :{
                 ZStack{
                 
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 250 , height: 40)
                        Text("Logout")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                 }
                
                .padding()
            }
    }
}

#Preview {
    ProfileView()
}
