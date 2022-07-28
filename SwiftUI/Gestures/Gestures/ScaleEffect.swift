//
//  ScaleEffect.swift
//  Gestures
//
//  Created by Truong Tommy on 7/28/22.
//

import SwiftUI

struct ScaleEffect: View {
    @GestureState var isLongPressed = false
    @State var offset : CGSize = .zero
    var body: some View {

        let dragGesture = DragGesture()
            .onChanged { value in
                // let point = value.startLocation
                self.offset = value.translation
            }
           // .onEnded()
        
        
        VStack {
            Circle()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(isLongPressed ? .orange : .blue)
                .offset(x: offset.width, y: offset.height)
                .gesture(dragGesture)
                .animation(Animation.spring())

        }
        
    }
}

struct ScaleEffect_Previews: PreviewProvider {
    static var previews: some View {
        ScaleEffect()
    }
}
