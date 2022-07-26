//
//  CameraPreview.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI
import AVFoundation

struct CameraPreview : UIViewRepresentable {
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) ->  UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        // custom
        camera.preview.videoGravity = .resizeAspectFill
        camera.preview.connection?.videoOrientation = .portrait
        view.layer.addSublayer(camera.preview)
        //start
        camera.session.startRunning()
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        print("")
    }
}
