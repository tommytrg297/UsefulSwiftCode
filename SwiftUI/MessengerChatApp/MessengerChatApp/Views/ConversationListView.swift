//
//  ConversationListView.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

struct ConversationListView: View {
    let usernames = ["Joe","Bill","Bob"]
    @State var otherUsername : String = ""
    @State var showChat = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(usernames,id: \.self) { user in
                    NavigationLink {
                        ChatView(otherUsername : user)
                    } label: {
                        HStack {
                            Circle()
                                .foregroundColor(.pink)
                                .frame(width: 55, height: 55)
                            Text(user)
                                .bold()
                                .foregroundColor(Color(.label))
                                .font(.system(size: 30))
                            Spacer()
                        }
                        .padding()
                    }

                }
            }
            .navigationTitle("Conversations")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SearchView { name in
                            self.otherUsername = name
                            self.showChat = true
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign out") {
                        self.signOut()
                    }

                }
            }
        }
        if !otherUsername.isEmpty {
            NavigationLink(isActive: $showChat) {
                ChatView(otherUsername: otherUsername)
            } label: {
                Text("")
            }

        }
        
    }
    
    func signOut() {
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
    }
}
