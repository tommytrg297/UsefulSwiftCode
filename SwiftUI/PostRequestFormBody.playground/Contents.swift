//// GET , POST
import UIKit
import Foundation
import PlaygroundSupport

func APICall() {
    guard let url = URL(string: "https://api.fpt.ai/vision/idr/vnm/") else {
        return
    }
    var request = URLRequest(url: url)
    //method, body
    request.httpMethod = "POST"
    request.setValue("8DBTkyF9lLOUXwcggAK9lWDTIxJoIkt6", forHTTPHeaderField: "api-key")

    /// SET LINE HERE

    let image = UIImage(named: "cccdPhat.jpeg")
    let imageData = image?.jpegData(compressionQuality: 0.5)
    
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

    //request.httpBody = try? JSONSerialization.data(withJSONObject: param as Any , options: .fragmentsAllowed)

    // make request
    let task = URLSession.shared.dataTask(with: request) { data, res, error in
        guard let data = data, error == nil else {
            print("ERROR")
            return
        }
        do {
            let response = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
            print("\(response)")
        } catch  {
            print(error)
        }
    }
    task.resume()
}

APICall()


