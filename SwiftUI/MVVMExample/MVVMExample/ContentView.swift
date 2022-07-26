//
//  ContentView.swift
//  MVVMExample
//
//  Created by Truong Tommy on 7/19/22.
//

import SwiftUI

struct ToDoListItem : Identifiable {
    var id = UUID()
    var action : String
}
class ToDoList : ObservableObject {
    @Published var items : [ToDoListItem] = [
//        ToDoListItem(action: "Buy Milk")
    ]
}

struct ContentView: View {
    @ObservedObject var viewModel : ToDoList  = ToDoList()
    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.items){ item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    self.viewModel.items = [
                        ToDoListItem(action: "Buy Milk"),
                        ToDoListItem(action: "learn SwiftUI"),
                        ToDoListItem(action: "Go to work")
                    ]
                } label: {
                    Text("Refresh")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
