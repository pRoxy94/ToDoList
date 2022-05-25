//
//  Item.swift
//  ToDoList
//
//  Created by Rossana Laricchia on 24/05/22.
//

import Foundation

// Immutable Struct
struct Item: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
	   self.id = id
	   self.title = title
	   self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> Item {
	   return Item(id: id, title: title, isCompleted: !isCompleted)
    }
}

