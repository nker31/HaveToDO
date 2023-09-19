//
//  ListRowView.swift
//  HaveToDo
//
//  Created by Nathat Kuanthanom on 26/2/2566 BE.
//

import SwiftUI

struct ListRowView: View {
    let item: itemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }.padding(.vertical, 8)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "firstOne", isCompleted: true)
    static var item2 = itemModel(title: "Two", isCompleted: false)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
