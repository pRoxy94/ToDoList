//
//  ListRowView.swift
//  ToDoList
//
//  Created by Rossana Laricchia on 23/05/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Item
    
    var body: some View {
	   HStack {
		  Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
			 .foregroundColor(item.isCompleted ? .green : .red)
		  Text(item.title)
		  Spacer()
	   }
	   .font(.title3)
	   .padding(.vertical, 5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = Item(title: "First item!", isCompleted: false)
    static var item2 = Item(title: "Second item!", isCompleted: true)
    
    static var previews: some View {
	   Group {
		  ListRowView(item: item1)
		  ListRowView(item: item2)
	   }
	   .previewLayout(.sizeThatFits)
    }
}
