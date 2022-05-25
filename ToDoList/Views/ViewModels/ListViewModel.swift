//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Rossana Laricchia on 25/05/22.
//

import Foundation

/*
 CRUD Function
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [Item] = [] {
	   // gets called anytime  we set this items, anytime we change the items array
	   didSet {
		  saveItems()
	   }
    }
    
    
    let itemsKey: String = "item_list"
    
    init() {
	   getItems()
    }
    
    func getItems() {
//	   let newItems = [
//		  Item(title: "This is the first title", isCompleted: false),
//		  Item(title: "This is the second", isCompleted: true),
//		  Item(title: "Third!", isCompleted: false)
//	   ]
//	   items.append(contentsOf: newItems)
	   
	   guard
		  let data = UserDefaults.standard.data(forKey: itemsKey),
		  let savedItems = try? JSONDecoder().decode([Item].self, from: data)
	   else { return }
	   
	   self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
	   items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
	   items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
	   let newItem = Item(title: title, isCompleted: false)
	   items.append(newItem)
    }
    
    func updateItem(item: Item) {
//	   if let index = items.firstIndex { (existingItem) -> Bool in
//		  return existingItem.id == item.id
//	   } { }
	   
	   // is the same as the lines above
	   if let index = items.firstIndex(where: { $0.id == item.id }) {
		  items[index] = item.updateCompletion()
	   }
    }
    
    func saveItems() {
	   if let encodedData = try? JSONEncoder().encode(items) {
		  UserDefaults.standard.set(encodedData, forKey: itemsKey)
	   }
    }
}
