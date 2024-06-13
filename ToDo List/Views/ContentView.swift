//
//  ContentView.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var ViewModel = ContentViewViewModel()
    
    var body: some View {
        
        if ViewModel.isSignedIn , !ViewModel.currentUserId.isEmpty {
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView : some View {
        TabView{
            ToDoListView(userID : ViewModel.currentUserId)
                .tabItem {
                    Label("Home" , systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile" , systemImage:"person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
