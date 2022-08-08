//
//  ShowImage.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/21/22.
//

import SwiftUI

struct ShowImage: View {
    @Environment(\.dismiss) var dismiss
    @Binding var imageTaken : UIImage
    
    var body: some View {
        VStack{
            Text("Document")
            ZStack {
                GeometryReader { geometry in
                    Image(uiImage: imageTaken)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width,
                               height: geometry.size.height)
                        .clipped()
                }
            }
            NewVietnameseIDFrontResultView(image: $imageTaken)
//            NewVietnameseIDBackResultView(image: $imageTaken)
            Button("Press to dismiss") {
                        dismiss()
                    }
                    .font(.title)
                    .padding()
        }
    }
}

struct ShowImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowImage(imageTaken: .constant(UIImage(systemName: "star")!))
    }
}


