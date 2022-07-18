//
//  ViewController.swift
//  CoreMLDemo
//
//  Created by Truong Tommy on 7/17/22.
//

import CoreML
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Prediction here"
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 20, y: view.safeAreaInsets.top, width: 200, height: 200)
        label.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 250, width:  100, height: 100)
         
    }
    
    func analyzeImage (image : UIImage?){
        guard let buffer = image?.resize(size: CGSize(width: 224, height: 224))?
            .getCVPixelBuffer() else {
            return
        }
        do {
            let config = MLModelConfiguration()
            let model = try GoogLeNetPlaces(configuration: config)
            let input = GoogLeNetPlacesInput(sceneImage: buffer)
            
            let output = try model.prediction(input: input)
            let text = output.sceneLabel
            label.text = text
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    @objc func didTapImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //cancelled
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
        analyzeImage(image: image)
    }

}

