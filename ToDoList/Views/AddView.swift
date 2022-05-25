//
//  AddView.swift
//  ToDoList
//
//  Created by Rossana Laricchia on 24/05/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var text: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
	   ScrollView {
		  VStack {
			 TextField("Type something here...", text: $text)
				.padding()
				.frame(height: 55)
				.background(Color.gray.opacity(0.2))
			 .cornerRadius(10)
			 
			 Button(action: {
				saveButtonPressed()
			 }, label: {
				Text("Save".uppercased())
				    .foregroundColor(.white)
				    .font(.headline)
				    .frame(height: 55)
				    .frame(maxWidth: .infinity)
				    .background(Color.accentColor)
				    .cornerRadius(10)
			 })
		  }
		  .padding()
	   }
	   .navigationTitle("Add an Item 🖊")
	   .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
	   if validateText() {
		  listViewModel.addItem(title: text)
		  presentationMode.wrappedValue.dismiss()
	   }
    }
    
    func validateText() -> Bool {
	   if text.count < 3 {
		  alertTitle = "Your new item must be at least 3 characters long. 😫"
		  showAlert.toggle()
		  return false
	   }
	   return true
    }
    
    func getAlert() -> Alert {
	   return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
	   NavigationView {
		  AddView()
	   }
	   .environmentObject(ListViewModel())
    }
}
