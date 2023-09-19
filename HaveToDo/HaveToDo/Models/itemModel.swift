//
//  itemModel.swift
//  HaveToDo
//
//  Created by Nathat Kuanthanom on 26/2/2566 BE.
//

import Foundation

struct itemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    
    func updateCompletion() -> itemModel{
        itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
