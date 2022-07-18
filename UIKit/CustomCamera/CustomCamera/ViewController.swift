//
//  ViewController.swift
//  CustomCamera
//
//  Created by Truong Tommy on 7/5/22.
//

import AVFoundation
import UIKit
import SwiftUI

class ViewController: UIViewController {
    //Capture Session
    var session : AVCaptureSession?
    // Photo Output
    let output = AVCapturePhotoOutput()
    // Video Preview
    let previewLayer = AVCaptureVideoPreviewLayer()
    // Shutter Button
    private let shutterButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 0
        button.layer.backgroundColor = .backgroundPurple
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(UIImage(systemName: "camera")?.withTintColor(.white), for: .normal)
        return button
    }()
    let instructions : UILabel = {
        var label = UILabel()
        label.text = "Can cuoc cong dan (mac truoc)"
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray
//      previewLayer.backgroundColor = CGColor(
        view.layer.addSublayer(previewLayer)
        view.addSubview(shutterButton)
        checkCameraPermission()
        view.addSubview(instructions)
        
        shutterButton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageFrame = CGRect(x: view.safeAreaLayoutGuide.layoutFrame.minX,
                                y: view.safeAreaInsets.top,
                                    width: view.bounds.width,
                                    height: view.bounds.height/3)
        
        instructions.center = view.center
        instructions.frame = CGRect(x: view.safeAreaLayoutGuide.layoutFrame.minX,
                                    y: view.safeAreaInsets.top + view.bounds.height/2,
                                        width: view.bounds.width,
                                        height: view.bounds.height/3)
        instructions.backgroundColor = .systemTeal

        previewLayer.frame = imageFrame
        shutterButton.center = CGPoint(x: view.frame.size.width/2,
                                       y: view.frame.size.height - 100)
    }
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .notDetermined: // request
            AVCaptureDevice.requestAccess(for: .video) { granted in
                guard granted else {
                    return
                }
                DispatchQueue.main.async {
                    self.setUpCamera()
                }
            }
        case .restricted: // show
            break
        case .denied:
            break
        case .authorized:
            setUpCamera()
        @unknown default:
            break
        }
    }
    private func setUpCamera() {
        let session = AVCaptureSession()
        if let device = //  AVCaptureDevice.default(for: .video)
            AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera,.builtInDualWideCamera,.builtInWideAngleCamera], mediaType: .video, position: .front).devices.first
        {
//            print(device.activeFormat)
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input){
                    session.addInput(input)
                }
                if session.canAddOutput(output){
                    session.addOutput(output)
                }
               // previewLayer
                previewLayer.videoGravity =  .resizeAspectFill
                previewLayer.session = session
                
                session.startRunning()
                self.session = session
            }
            catch  {
                print(error)
            }
        }
    }

    
    @objc private func didTapTakePhoto() {
        output.isHighResolutionCaptureEnabled = true
        output.capturePhoto(with: AVCapturePhotoSettings(),
                            delegate: self)
            }
    


}

extension ViewController : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation()  else {
            return
        }
        let image = UIImage(data: data)
        session?.stopRunning()
        
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: view.safeAreaLayoutGuide.layoutFrame.minX,
                                 y: view.safeAreaLayoutGuide.layoutFrame.minY,
                                 width: view.bounds.width,
                                 height: view.bounds.height/3)
        
        let showTextVC = ScanInstructionsViewController(capturedImage: image!)
        
        showTextVC.modalPresentationStyle = .fullScreen
        showTextVC.modalTransitionStyle = .crossDissolve
        present(showTextVC, animated: true)
        session?.startRunning()
    }
}
