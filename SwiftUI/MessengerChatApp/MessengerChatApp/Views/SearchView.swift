//
//  SearchView.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI



struct SearchView: View {
    @State var text : String = ""
    let usernames = ["Julia", "Tommy"]
    let completion : ((String) -> Void)
    init(completion : @escaping ((String) -> Void)) {
        self.completion = completion
    }
    var body: some View {
        VStack {
            TextField("Username...", text: $text)
                .modifier(CustomField())
            
            Button("Search"){
                
            }
            
            ForEach(usernames, id: \.self) { name in
                HStack {
                    Circle()
                        .frame(width: 55, height: 55)
                        .foregroundColor(.green)
                    Text(name)
                        .bold()
                    Spacer()
                }
                .onTapGesture {
                    completion(name)
                }
            }
            
            Spacer()
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() { _ in
            
        }
    }
}