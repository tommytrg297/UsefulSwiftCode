//
//  ContentView.swift
//  UsingMapKit
//
//  Created by Truong Tommy on 3/9/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region,showsUserLocation: true)
            .frame(maxWidth: UIScreen.main.bounds.width,
                   maxHeight: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
