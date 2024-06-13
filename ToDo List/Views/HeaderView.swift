//
//  HeaderView.swift
//  ToDo List
//
//  Created by Vijapura Akib on 23/05/24.
//

import SwiftUI

struct HeaderView: View {
    let title :String
    let subtitle : String
    let color : Color
    
    var body : some View{
        VStack{
            Text(title)
                .font(.system(size: 50))
                .foregroundStyle(color)
                .fontWeight(.bold)
                .padding(.top , 30)
            Text(subtitle)
                .font(.system(size : 30))
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle" , color: .blue)
}
