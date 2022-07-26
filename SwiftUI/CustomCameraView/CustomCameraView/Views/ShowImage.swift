//
//  ShowImage.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/21/22.
//

import SwiftUI

struct ShowImage: View {
    @Environment(\.dismiss) var dismiss
    @Binding var image: UIImage

    var body: some View {
        VStack{
            Text("Document")
            ZStack {
                GeometryReader { geometry in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width,
                               height: geometry.size.height/3)
                        .clipped()

                }
            }
                
            Button("Press to dismiss") {
                        dismiss()
                    }
                    .font(.title)
                    .padding()
                    .background(.black)

        }
    }
}

struct ShowImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowImage(image: Binding.constant(UIImage(systemName: "person")!))
    }
}


struct MaskShape : Shape {
    var inset : UIEdgeInsets
    
    func path(in rect: CGRect) -> Path {
        var shape = Rectangle().path(in: rect)
        shape.addPath(Rectangle().path(in: rect.inset(by: inset)))
        return shape
    }
}
