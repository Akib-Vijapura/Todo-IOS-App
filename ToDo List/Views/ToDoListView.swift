//
//  ToDoListItemsView.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var ViewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    
    init(userID : String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/todos"
        )
        
        self._ViewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userID))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if !items.isEmpty{
                    List(items){ item in
                        ToDOListItemView(item: item)
                            .swipeActions{
                                Button("Delete"){
                                    ViewModel.delete(id: item.id)
                                }
                                .tint(Color.red)
                            }
                    }
                    .listStyle(PlainListStyle())
                }else {
                    VStack{
                        Image(systemName: "trash")
                            .font(.system(size: 200))
                        Text("No Todos Found!")
                            .font(.system(size: 40))
                    }
                    .padding(.bottom , 100)
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //action
                    ViewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                        .padding()
                }
            }
            .sheet(isPresented: $ViewModel.showingNewItemView){
                NewItemView( newItemPresented: $ViewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "7vuW7jquLCcoQjlseAacZX7pOJf1")
}
