//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Truong Tommy on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var presentModal = false
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number:")
                    Text("\(number)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                }
                Group {
                    Button("New Number") {
                        number = Int.random(in: 1...10)
                    }
                    Button("Show Modal") {
                        presentModal = true
                    }
                    .sheet(isPresented: $presentModal) {
                        ModalSheetView()
                    }
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.blue)
                .cornerRadius(7)
            }
            .navigationTitle("Property Wrappers 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Text("Go Next")
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
