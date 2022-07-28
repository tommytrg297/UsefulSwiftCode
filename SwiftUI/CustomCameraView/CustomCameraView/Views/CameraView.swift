//
//  CameraView.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI

struct CameraView : View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @StateObject var camera = CameraModel()

    var body: some View {
        ZStack{
             CameraPreview(camera: camera)
                .ignoresSafeArea()
            if !camera.isTaken{
                GeometryReader { geometry in
                    Color.black.opacity(0.6)
                        .mask {
                            MaskShape(inset: UIEdgeInsets(
                                top: geometry.size.height/3,
                                left: geometry.size.width,
                                bottom: geometry.size.height/3,
                                right: geometry.size.width))
                            .fill(style: FillStyle(eoFill: true))
                        }
                }
                .ignoresSafeArea()
                
                VStack {
                    Text("Scan tai lieu trong khung")
                        .background(.purple)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                }
            }
            VStack{
                if camera.isTaken {
                    Spacer()
                    Button(action: {camera.retakePicture()}) {
                        Text("Tro lai")
                            .confirmationButton()
                        }
        
                    NavigationLink {
                        ShowImage(imageTaken: $camera.imageTaken)
                    } label: {
                        Text("Tiep tuc")
                            .confirmationButton()
                    }
                }
                else {
                    VStack{
                        Spacer()
                        HStack {
                            Button(action: {camera.takePicture()
                                print(camera.isTaken)
                            }) {
                                CameraButton()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            camera.checkAuthorization()
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
    }
}



struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
