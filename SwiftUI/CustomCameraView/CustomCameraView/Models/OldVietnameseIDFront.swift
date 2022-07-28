//
//  OldVietnameseIDFront.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/25/22.
//

struct OldVietnameseIDFront: Codable {
    let errorCode: Int
    let errorMessage: String
    let data: [OldVietnameseIDFrontData]
}

// MARK: - Datum
struct OldVietnameseIDFrontData: Codable {
    let id, idProb, name, nameProb: String
    let dob, dobProb, home, homeProb: String
    let address, addressProb: String
    let addressEntities: OldVietnameseIDFrontAddressEntities
    let type: String

    enum CodingKeys: String, CodingKey {
        case id
        case idProb = "id_prob"
        case name
        case nameProb = "name_prob"
        case dob
        case dobProb = "dob_prob"
        case home
        case homeProb = "home_prob"
        case address
        case addressProb = "address_prob"
        case addressEntities = "address_entities"
        case type
    }
}

// MARK: - AddressEntities
struct OldVietnameseIDFrontAddressEntities: Codable {
    let province, district, ward, street: String
}


