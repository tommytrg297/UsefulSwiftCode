//
//  InstructionsFrameView.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/19/22.
//

import SwiftUI

struct InstructionsFrameView: View {
    var body: some View {
        VStack(alignment: .center){
            GeometryReader { proxy in
                RoundedRectangle(cornerRadius: 10)
                    .padding()
                    .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).height)
                    .opacity(0.5)
                    .padding()
                    .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                    .foregroundColor(.white.opacity(0.5))
                    }
            
            GeometryReader { proxy in
                    VStack{
                        Text("Can cuoc cong dan")
                            .font(.largeTitle)
                            .bold()
                            .padding(20)
                        Text("Xin hay giu giay to trong vung chup")
                            .padding()
                    }
                    .background(.purple)
                    .cornerRadius(10)
                    .padding()
                }
        }
    }
}

struct InstructionsFrameView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsFrameView()
    }
}
