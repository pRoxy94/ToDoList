//
//  ListView.swift
//  ToDoList
//
//  Created by Rossana Laricchia on 23/05/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
	   List {
		  ForEach(listViewModel.items) { item in
			 ListRowView(item: item)
				.onTapGesture {
				    withAnimation(.linear) {
					   listViewModel.updateItem(item: item)
				    }
				}
		  }
		  .onDelete(perform: listViewModel.deleteItem)
		  .onMove(perform: listViewModel.moveItem)
	   }
	   .navigationTitle("Todo List 📝")
	   .toolbar {
		  ToolbarItem(placement: .navigationBarTrailing, content: {
			 NavigationLink(
				"Add",
				destination: AddView()
			 )
		  })
		  
		  ToolbarItem(placement: .navigationBarLeading) {
			 EditButton()
		  }
	   }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
	   NavigationView {
		  ListView()
	   }
	   .environmentObject(ListViewModel())
    }
}
