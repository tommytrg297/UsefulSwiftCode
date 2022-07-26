//
//  ChatView.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

struct ChatView: View {
    let otherUsername : String
    init(otherUsername : String) {
        self.otherUsername = otherUsername
    }
    @State var message :  String = ""
    var body: some View {
        VStack {
            ScrollView(.vertical)  {
                ChatRow(text : "Hello World", type: .sent)
                    .padding(3)
                ChatRow(text : "Hello World", type: .received)
                    .padding(3)
                ChatRow(text : "Hello World", type: .sent)
                    .padding(3)
            }
            HStack {
                TextField("Message : ...", text: $message)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(7)
                SendButton(text: $message)
            }
        }
        .navigationTitle(otherUsername)

    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(otherUsername: "TOMMY")
    }
}
