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
    let data: [NewVietnameseIDFrontData]
    
    static var cccdPhat = NewVietnameseIDFront(errorCode: 0, errorMessage: "", data: [data])
    static var data = NewVietnameseIDFrontData(id: "079099034865", idProb: "96.24", name: "TRƯƠNG NHƯ PHÁT", nameProb: "89.94", dob: "29/07/1999", dobProb: "99.72", sex: "NAM", sexProb: "98.28", nationality: "VIỆT NAM", nationalityProb: "89.59", home: "THỪA THIÊN HUẾ", homeProb: "98.82", address: "44 NGUYỄN VĂN GIAI, P.ĐA KAO, QUẬN 1, TP.HỒ CHÍ MINH", addressProb: "50.01", addressEntities: addressEntities, doe: "29/07/2024", doeProb: "96.17")
    static var addressEntities = AddressEntities(province: "HỒ CHÍ MINH", district: "QUẬN 1", ward: "ĐA KAO", street: "44 NGUYỄN VĂN GIAI")

}

struct NewVietnameseIDFrontData: Codable, Identifiable{

    let id, idProb, name, nameProb: String
    let dob, dobProb, sex, sexProb: String
    let nationality, nationalityProb, home, homeProb: String
    let address, addressProb: String
    let addressEntities: AddressEntities
    let doe, doeProb: String
    let type : String = "Can cuoc cong dan mac truoc"
    

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
        case type = "Cang cuoc cong dan mac truoc"
    }
}

// MARK: - AddressEntities
struct AddressEntities: Codable {
    let province, district, ward, street: String
}


