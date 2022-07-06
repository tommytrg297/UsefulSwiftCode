//
//  ContentView.swift
//  UsingMapKit
//
//  Created by Truong Tommy on 3/9/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //RPI!
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region,showsUserLocation: true)
            .ignoresSafeArea()
            .tint(.red)
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


