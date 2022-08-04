//
//  SignInView.swift
//  MessengerChatApp
//
//  Created by Truong Tommy on 7/24/22.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var model : AppStateModel
    @State var username : String = ""
    @State var password : String = ""
    var body: some View {
        NavigationView {
            VStack {
                // Heading
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text("Messenger")
                    .bold()
                    .font(.system(size: 32))
                Spacer()
                
                // Text field
                VStack {
                    TextField("Username", text: $username)
                        .modifier(CustomField())
                    SecureField("Password", text: $password)
                        .modifier(CustomField())
                    Button {
                        self.signIn()
                    } label: {
                        Text("Sign in")
                            .foregroundColor(.white)
                            .frame(width: 220, height: 50)
                            .background(.blue)
                            .cornerRadius(6)
                    }
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Text("New to messenger?")
                    NavigationLink("Create account") {
                        SignUpView()
                    }

                }
                
                
                
                // Sign up

            }
        }
    }
    private func signIn(){
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        model.signIn(username: username, password: password)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            
    }
}
