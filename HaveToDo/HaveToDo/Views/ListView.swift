//
//  ListView.swift
//  HaveToDo
//
//  Created by Nathat Kuanthanom on 26/2/2566 BE.
//

import SwiftUI

struct ListView: View {
    
   
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if (listViewModel.items.count < 1){
                Text("To-do List is empty")
            }else{
                List{
                    ForEach(listViewModel.items) {item in
                        ListRowView(item: item).onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                    }.onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    
                }
            }
        }
        .navigationTitle("Have to do 🗒️")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView()))
            
    }
    
    
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}


