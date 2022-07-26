//
//  MainView.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/22/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var config : Configuration
    var body: some View {
        
        NavigationView {
            VStack{
                NavigationLink {
                    CameraView()
                } label: {
                    Text("Begin scanning")
                }

                Text("Type of document currently scanning:  \(config.OCRDocument.rawValue)")
                
                NavigationLink {
                    SettingsView()
                } label: {
                    Text("Settings")
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
