//
//  NewVietnameseIDFront.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/25/22.
//

import Foundation

struct NewVietnameseIDFront : Codable{
    let errorCode: Int
    let errorMessage: String
    let data: [Datum]
}

struct Datum: Codable {
    let id, idProb, name, nameProb: String
    let dob, dobProb, sex, sexProb: String
    let nationality, nationalityProb, home, homeProb: String
    let address, addressProb: String
    let addressEntities: AddressEntities
    let doe, doeProb, type: String

    enum CodingKeys: String, CodingKey {
        case id
        case idProb = "id_prob"
        case name
        case nameProb = "name_prob"
        case dob
        case dobProb = "dob_prob"
        case sex
        case sexProb = "sex_prob"
        case nationality
        case nationalityProb = "nationality_prob"
        case home
        case homeProb = "home_prob"
        case address
        case addressProb = "address_prob"
        case addressEntities = "address_entities"
        case doe
        case doeProb = "doe_prob"
        case type
    }
}

// MARK: - AddressEntities
struct AddressEntities: Codable {
    let province, district, ward, street: String
}
