//
//  ViewController.swift
//  Alamofire
//
//  Created by Truong Tommy on 7/23/22.
//


import UIKit

class ViewController: UIViewController {
    
//    let image = UIImage.init(named: "myImage")
//    let imgData = UIImageJPEGRepresentation(image!, 0.2)!
//
//    let parameters = ["api-key": rname] //Optional for extra parameter
//
//    Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//                } //Optional for extra parameters
//        },
//    to:"mysite/upload.php")
//    { (result) in
//        switch result {
//        case .success(let upload, _, _):
//
//            upload.uploadProgress(closure: { (progress) in
//                print("Upload Progress: \(progress.fractionCompleted)")
//            })
//
//            upload.responseJSON { response in
//                 print(response.result.value)
//            }
//
//        case .failure(let encodingError):
//            print(encodingError)
//        }
//    }
    let imageView = UIImageView(image: UIImage(named: "cccdPhat.jpeg"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
    }
    override func viewDidLayoutSubviews() {
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    }
    


}

