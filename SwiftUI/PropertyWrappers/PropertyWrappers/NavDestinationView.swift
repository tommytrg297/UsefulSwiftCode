//
//  NavDestinationView.swift
//  PropertyWrappers
//
//  Created by Truong Tommy on 7/21/22.
//

import SwiftUI

struct NavDestinationView: View {
    var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number")
                    Text("??")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                }
                Button("New Number") {
                    
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.green)
                .cornerRadius(7)
            }
            .frame(width: 200)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { // <3>
                    VStack {
                        Text("User Name").font(.subheadline)
                        Text("Anonymous").font(.headline)
                    }
                }
        }
    }
}

struct NavDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavDestinationView()
    }
}
