//
//  SettingsScreen.swift
//  AddingSwiftUItoUIKit
//
//  Created by Truong Tommy on 7/16/22.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var isOn = false
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    Toggle("Is subscribe", isOn: $isOn)
                    Toggle("Is subscribe", isOn: $isOn)
                    Toggle("Is subscribe", isOn: $isOn)
                    Button("Go back") {

                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
