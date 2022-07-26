//
//  CustomCameraViewApp.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI

 @main
struct CustomCameraViewApp: App {
    var config : Configuration = Configuration(
        APIKey: "",
        OCRType: .photo,
        OCRDocument: .passport,
        captureMode: .manual,
        color: .purple,
        showFinalScreenResult: false,
        submitResultToFPTServer: false)
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(config)
        }
    }
}
