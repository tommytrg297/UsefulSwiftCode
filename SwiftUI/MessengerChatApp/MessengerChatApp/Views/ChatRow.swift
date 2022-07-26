//
//  ChatRow.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

struct ChatRow: View {
    let text : String
    let type : messageType
    init( text: String, type: messageType) {
        self.type = type
        self.text = text
    }
    var isSender : Bool {
        return type == .sent
    }
    var body: some View {
       
        HStack {
            if isSender{Spacer()}
            if !isSender{
                VStack {
                    Spacer()
                    Circle()
                        .foregroundColor(.pink)
                        .frame(width: 45, height: 45)
                }
            }

            HStack {
                Text(text)
                    .foregroundColor(isSender ? Color.white : Color(.label))
                    .padding()
            }
            .background(isSender ? Color.blue : Color(.systemGray4))
            .cornerRadius(12)
            .padding(isSender ? .leading : .trailing,
                     isSender ? UIScreen.main.bounds.width/3 : UIScreen.main.bounds.width/5)

            if !isSender{Spacer()}
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ChatRow(text: "Hello", type: .sent)
            ChatRow(text: "Hello", type: .received)

        }
    }
}
