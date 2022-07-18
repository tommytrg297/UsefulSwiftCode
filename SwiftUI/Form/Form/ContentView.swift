//
//  ContentView.swift
//  Form
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var subscribed = false
    @State private var numberOfLikes = 1

    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    DatePicker("Birth date", selection: $birthDate, displayedComponents: .date)
                } header: {
                    Text("Personal Information")
                }
                Section {
                    Toggle("Subscribed", isOn: $subscribed)
                        .tint(.green)
                } header: {
                    Text("Actions")
                }
                
                Stepper("Number of Likes: \(numberOfLikes)", value: $numberOfLikes, in: 1...100)
                
                Link("Go to google", destination: URL(string:"https://google.com")!)
  
            }
            .tint(.blue)
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Save"){
                    }

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

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
