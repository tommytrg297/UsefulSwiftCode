//
//  AppStateModel.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import Foundation
import SwiftUI


class AppStateModel : ObservableObject {
    @Published var showingSignIn : Bool = true
    
    // IS User signed in
    
    // current user being chatted with
    // Messages, convos
}

// Search
extension AppStateModel {
    
}
// Conversation
extension AppStateModel {
    
}
// GetChat / Get messages
extension AppStateModel {
    
}
// Sign in and sign up users
extension AppStateModel {
    func signIn(username : String, password : String) {
        // try to sign in
        
    }
}
