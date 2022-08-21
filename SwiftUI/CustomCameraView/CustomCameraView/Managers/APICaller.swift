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
    
    private init(){}
    
    public func APICall(imageTaken:UIImage, completion : @escaping (Result<[NewVietnameseIDFrontData],Error>) -> Void) {
        guard let url = URL(string: "https://api.fpt.ai/vision/idr/vnm/") else {
            return 
        }
        var request = URLRequest(url: url)
        //method, body
        request.httpMethod = "POST"
        request.setValue("8DBTkyF9lLOUXwcggAK9lWDTIxJoIkt6", forHTTPHeaderField: "api-key")
        
        let image = imageTaken
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)",
                            forHTTPHeaderField: "Content-Type")
        var data = Data()
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
                completion(.success(response.data))                
            } catch  {
                print(error)
            }
        }
        task.resume()
    }
    
//    public func createImageData(image : UIImage) -> Data {
//        let image = UIImage(named: "cccdPhat.jpeg")
//        let imageData = image?.jpegData(compressionQuality: 0.8)
//
//    }
    
    private func createRequest(
        image : UIImage,
        documentType : OCRDocumentType,
        completion : @escaping (URLRequest) -> Void) {
            
        let url = URL(string: documentType.URL)
        var request = URLRequest(url: url!)
        //method, body
        request.httpMethod = "POST"
        request.setValue("8DBTkyF9lLOUXwcggAK9lWDTIxJoIkt6", forHTTPHeaderField: "api-key")
        
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)",
                            forHTTPHeaderField: "Content-Type")
        var data = Data()
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"image\"; filename=\"cccd.jpeg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(imageData!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = data
        completion(request)
    }
    
    public func getInformationFromDocument(
        image : UIImage,
        documentType : OCRDocumentType,
        completion : @escaping (Result<[NewVietnameseIDFrontData],Error>) -> Void) {
            
        createRequest(image: image, documentType: documentType) { request in
            let task = URLSession.shared.dataTask(with: request) { data, res, error in
                guard let data = data, error == nil else {
                    print("ERROR")
                    return
                }
                do {
                    let response = try JSONDecoder().decode(NewVietnameseIDFront.self, from: data)
                    completion(.success(response.data))
                } catch  {
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    public func getInformationFromNewNationalID(
        image : UIImage,
        completion : @escaping (Result<[NewVietnameseIDFrontData],Error>) -> Void ) {
            createRequest(image: image, documentType: .identityCard) { request in
            let task = URLSession.shared.dataTask(with: request) { data, res, error in
                guard let data = data, error == nil else {
                    print("ERROR")
                    return
                }
                do {
                        let response = try JSONDecoder().decode(NewVietnameseIDFront.self, from: data)
                        completion(.success(response.data))
                } catch  {
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    public func getInformationFromNewNationalIDBack(
        image : UIImage,
        completion : @escaping (Result<[NewVietnameseIDBackData],Error>) -> Void ) {
            createRequest(image: image, documentType: .identityCard) { request in
            let task = URLSession.shared.dataTask(with: request) { data, res, error in
                guard let data = data, error == nil else {
                    print("ERROR")
                    return
                }
                do {
                        let response = try JSONDecoder().decode(NewVietnameseIDBack.self, from: data)
                        completion(.success(response.data))
                } catch  {
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    
    
    
    
    public func getInformationFromOldNationalID(
        image : UIImage,
        documentType : OCRDocumentType,
        side : String,
        completion : @escaping (Result<[OldVietnameseIDFrontData],Error>) -> Void ) {
            
        createRequest(image: image, documentType: documentType) { request in
            let task = URLSession.shared.dataTask(with: request) { data, res, error in
                guard let data = data, error == nil else {
                    print("ERROR")
                    return
                }
                do {
                    if side == "front" {
                        let response = try JSONDecoder().decode(OldVietnameseIDFront.self, from: data)
                        completion(.success(response.data))
                    }
//                    else if side == "back" {
//                        let response = try JSONDecoder().decode(OldVietnameseIDBack.self, from: data)
//                        completion(.success(response.data))
//                    }
                } catch  {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
