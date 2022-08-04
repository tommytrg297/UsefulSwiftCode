import Foundation


//let fileURL = Bundle.main.url(forResource: "CCCD", withExtension: "json")!


func createRequest() throws -> URLRequest {
    let parameters : [String:String] = [:]

    let boundary = generateBoundaryString()
    
    let url = URL(string: "http://103.160.88.27:80/chip")!
    var request = URLRequest(url: url)
    request.httpMethod = "OPTIONS"
//    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "file")
//
//    let fileURL = Bundle.main.url(forResource: "CCCD", withExtension: "json")!
//    let filename = "CCCD.json"
//        var body = Data()
//        let data = try Data(contentsOf: fileURL)
////        body.append(data)
////        request.httpBody = body
//        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
//        let text = try String(contentsOf: fileURL)
//    body.append(data)
//        print(text)
    
//    request.httpBody = try createBody(with: parameters, filePathKey: "file", urls: [fileURL], boundary: boundary)
    
    return request
}

//private func createBody(with parameters: [String: String]? = nil, filePathKey: String, urls: [URL], boundary: String) throws -> Data {
//    var body = Data()
//
//    for url in urls {
//        let filename = url.lastPathComponent
//
//        let data = try Data(contentsOf: url)
////        body.append("file:")
//        body.append(data)
//
////        body.append("--\(boundary)\r\n")
////        body.append("Content-Disposition: form-data; name=\"\(filePathKey)\"; filename=\"\(filename)\"\r\n")
////        body.append("Content-Type: \(url)\r\n\r\n")
////        body.append(data)
////        body.append("\r\n")
//    }
//
//    body.append("--\(boundary)--\r\n")
//    return body
//}


let request = try createRequest()

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
        // handle error here
        print(error ?? "Unknown error")
        return
    }
    do {
        let answer : URLResponse
        answer = try response!
        print(response)
        print(data)

    } catch {
        print(error)
    }
}
task.resume()


private func generateBoundaryString() -> String {
    return "Boundary-\(UUID().uuidString)"
}


extension Data {
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
