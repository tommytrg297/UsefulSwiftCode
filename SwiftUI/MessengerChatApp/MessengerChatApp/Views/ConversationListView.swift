//
//  ConversationListView.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

struct ConversationListView: View {
    let usernames = ["Joe","Bill","Bob"]
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
        }
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
    }
}
