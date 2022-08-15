import Cocoa
import Foundation




struct PhotoResult: Codable {
    let createdAt, name: String
    let avatar: String
    let errorCode: Int
    let errorMessage: String
    let data: VehicleData
    let id: String
    

}

// MARK: - DataClass
struct VehicleData: Codable {
    let manufactor, color: String
    let license_plate : String
    let damages: [Damage]

    enum CodingKeys: String, CodingKey {
        case manufactor, color
        case license_plate
        case damages
    }
}

// MARK: - Damage
struct Damage: Codable {
    let image: String
    let data: [RepairDetail]
}

// MARK: - Datum
struct RepairDetail: Codable {
    let type, part, severity, cost: String
}

var res = [PhotoResult]()

let url = URL(string: "https://62f6012a612c13062b444702.mockapi.io/damage/hick")!

let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    guard let data = data, error == nil else { return }
    
    do {
        let answer = try? JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
        let response = try JSONDecoder().decode([PhotoResult].self, from: data)
        print(response[0].data)
    }
    catch {
        print(error)
    }

})
task.resume()
