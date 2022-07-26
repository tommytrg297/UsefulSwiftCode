//
//  APICaller.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/25/22.
//

import Foundation
import UIKit
import SwiftUI

final class APICaller {
    static let shared = APICaller()
    //image | API key | config | createData
    
    private init(){}
    
    public func APICall(imageTaken:UIImage) -> [Datum]{
        guard let url = URL(string: "https://api.fpt.ai/vision/idr/vnm/") else {
            return []
        }
        var request = URLRequest(url: url)
        //method, body
        request.httpMethod = "POST"
        request.setValue("8DBTkyF9lLOUXwcggAK9lWDTIxJoIkt6", forHTTPHeaderField: "api-key")
        
        let image = imageTaken//UIImage(named: "cccdPhat.jpeg")
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)",
                            forHTTPHeaderField: "Content-Type")
        var data = Data()
        var result : [Datum] = []
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"image\"; filename=\"cccd.jpeg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(imageData!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = data
        let task = URLSession.shared.dataTask(with: request) { data, res, error in
            guard let data = data, error == nil else {
                print("ERROR")
                return
            }
            do {
                let response = try JSONDecoder().decode(NewVietnameseIDFront.self, from: data)
                print(response.data)
                result = response.data
            } catch  {
                print(error)
            }
        }
        task.resume()
        return result
    }
    
//    public func createImageData(image : UIImage) -> Data {
//        let image = UIImage(named: "cccdPhat.jpeg")
//        let imageData = image?.jpegData(compressionQuality: 0.8)
//
//    }
    
    

    
    
    
}
