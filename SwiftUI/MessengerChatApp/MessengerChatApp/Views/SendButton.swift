//
//  SendButton.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

struct SendButton: View {
    @Binding var text : String
    var body: some View {
        Button {
            self.sendMessage()
        } label: {
            Image(systemName: "paperplane")
                .font(.system(size: 33))
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Circle())
        }
    }
    func sendMessage() {
        guard !text.isEmpty else {
            return
        }
    }
}

struct SendButton_Previews: PreviewProvider {
    static var previews: some View {
        SendButton(text: .constant("GELLO"))
    }
}
