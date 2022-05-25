//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Rossana Laricchia on 23/05/22.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
		  NavigationView {
			 ListView()
		  }
		  // ipad and iphone landscape view
		  .navigationViewStyle(StackNavigationViewStyle())
		  .environmentObject(listViewModel)
        }
    }
}
