//
//  ContentView.swift
//  Ratings
//
//  Created by Stewart Lynch on 2021-09-03.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    @State private var currentLove = 0
    var body: some View {
        VStack {
            RatingsView(currentRating: $currentLove, maxRating: 5, color: .systemBlue, fillImageName: "heart.fill", openImageName: "heart")
            RatingsView(currentRating: $currentRating)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
