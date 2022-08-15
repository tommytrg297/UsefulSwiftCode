//// GET , POST
import UIKit
import Foundation


struct Result: Codable {
    let color: String
    let damages: [Damage]
    let license_plate, manufacturer, model, total_cost: String

    enum CodingKeys: String, CodingKey {
        case color, damages
        case license_plate
        case manufacturer, model
        case total_cost
    }
}

// MARK: - Damage
struct Damage: Codable {
    let data: [Datum]
    let images: String
}

// MARK: - Datum
struct Datum: Codable {
    let cost, part, severity, type: String
}


func APICall() {
    guard let url = URL(string: "http://54.95.116.100:80/detect") else {
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    let image1 = UIImage(named: "dent_rear_bumper_car.jpg")
    let image1Data = image1?.jpegData(compressionQuality: 1)?.base64EncodedString()

    let image2 = UIImage(named: "dent_behind.png")
    let image2Data = image2?.pngData()?.base64EncodedString()
    
    let json  = [
        "file1" : image1Data,
        "file2" : image2Data
    ]
    let jsondata = try? JSONSerialization.data(withJSONObject: json)

    request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsondata
    
    let task = URLSession.shared.dataTask(with: request) { data, res, error in
        guard let data = data, error == nil else {
            print("ERROR")
            return
        }
        do {
            let response = try JSONDecoder().decode(Result.self, from: data)
            print("\(response)")
        } catch  {
            print(error)
        }
    }
    task.resume()
}

APICall()


