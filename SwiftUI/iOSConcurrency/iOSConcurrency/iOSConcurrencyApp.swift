//
//  iOSConcurrencyApp.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import SwiftUI
@main
struct iOSConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
