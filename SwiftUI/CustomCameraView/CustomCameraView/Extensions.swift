//
//  Extensions.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/19/22.
//

import SwiftUI

extension UIScreen{
    static let screenWidth = UIScreen.main.nativeBounds.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension Text {
    func confirmationButton() -> some View {
        self
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding(.vertical,10)
            .padding(.horizontal,20)
            .background(Color.purple)
            .clipShape(Capsule())
    }
}

extension Image {
    func reverseCamera() -> some View {
        self
            .foregroundColor(.blue)
            .padding()
            .background(.white)
            .clipShape(Circle())
    }
}

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}
