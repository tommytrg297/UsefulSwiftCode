//
//  MusicAppApp.swift
//  MusicApp
//
//  Created by Truong Tommy on 6/8/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    

    return true
  }
    
    
}



@main
struct MusicAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let data = OurData()
    init() {
        FirebaseApp.configure()
        data.loadAlbums()
        
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
        }
    }
}
