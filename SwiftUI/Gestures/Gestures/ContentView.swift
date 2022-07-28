//
//  ContentView.swift
//  Gestures
//
//  Created by Truong Tommy on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    @GestureState var isLongPressed = false
    

    var body: some View {
        let longPressGesture = LongPressGesture()
            .updating($isLongPressed) { newValue, state, transaction in
                state = newValue
            }
        VStack {
            Circle()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(isLongPressed ? .orange : .blue)
                .scaleEffect(isLongPressed ? 2 : 1 )
                .gesture(longPressGesture)
                .animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
