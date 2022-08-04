//
//  MessengerChatAppApp.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

@main
struct MessengerChatAppApp: App {
    var body: some Scene {
        WindowGroup {
            ConversationListView()
                .environmentObject(AppStateModel())
        }
    }
}
