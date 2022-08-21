//
//  CameraModel.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/18/22.
//

import SwiftUI
import AVFoundation

class CameraModel : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var settings = AVCapturePhotoSettings()
    @Published var picData = Data(count: 0)
    
    @Published var imageTaken : UIImage = UIImage()
    
    func checkAuthorization(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case.authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status{
                    self.setUp()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        @unknown default:
            break
        }
    }
    
    func setUp(){
        do {
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func takePicture() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
        }
    }
    
    func retakePicture(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil{
            return
        }
        guard let imageData = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: imageData)
        session.stopRunning()
        self.imageTaken = image!
    }
}
