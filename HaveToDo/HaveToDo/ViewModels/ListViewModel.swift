//
//  ListViewModel.swift
//  HaveToDo
//
//  Created by Nathat Kuanthanom on 26/2/2566 BE.
//

import Foundation

class ListViewModel: ObservableObject {
    
    
    @Published var items: [itemModel] = []{
        didSet{
            saveItem()
        }
    }
    
    let itemKey: String = "items_list"
    
    init(){
        getItem()
    }
    
    func getItem(){
        guard let data = UserDefaults.standard.data(forKey: itemKey) else{
            return
        }
        
        guard let savedItem = try? JSONDecoder().decode([itemModel].self, from: data) else{
            return
        }
        self.items = savedItem
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func updateItem(item: itemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
            
        }
    }
    
    func addItem(title: String){
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
