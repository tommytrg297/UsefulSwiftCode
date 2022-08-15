//
//  CustomCameraViewApp.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI

 @main
struct CustomCameraViewApp: App {
    var config : Configuration = Configuration()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(config)
        }
    }
}
