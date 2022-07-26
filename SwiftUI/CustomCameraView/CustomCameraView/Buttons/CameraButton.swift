//
//  CameraButton.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI

struct CameraButton: View {
    
//    @State private var animationAmount: CGFloat = 1
        var body: some View {
            Image(systemName: "camera").font(.title)
                .padding(20)
                .background(Color.purple)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.purple)
                    )

            
//                        .scaleEffect(animationAmount)
//                        .opacity(Double(2 - animationAmount))
//                        .animation(Animation.easeOut(duration: 1)
//                            .repeatForever(autoreverses: false))
//            )
//                .onAppear
//                {
//                    self.animationAmount = 2
//            }
        }
    }
//    var body: some View {
//        ZStack{
//            Circle()
//                .fill(.white)
//                .frame(width: 70, height: 70)
//            Circle()
//                .stroke(.white, lineWidth: 2)
//                .frame(width: 75, height: 75)
//        }
//    }



struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            CameraButton()
        }
        .ignoresSafeArea()
    }
}
