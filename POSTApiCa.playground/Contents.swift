// GET , POST

import Foundation

func APICall() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        return
    }
    var request = URLRequest(url: url)
    //method, body
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
    let body : [String:AnyHashable] = [
        "userId" : 1,
        "title" : "Hello Tommy",
        "body" : "How are you today? Im OK THANK YOU",
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    // make request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let response2 = try JSONDecoder().decode(Response.self, from: data)
            let response = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
            print("SUCCESS : \(response)")
            print(response2)
        } catch  {
            print(error)
        }

    }
    task.resume()

}

APICall()

struct Response : Codable {
    let body : String
    let id : Int
    let userId : Int
    let title : String
}
