//
//  OldDrivingLicence.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/26/22.
//

import Foundation

struct OldDrivingLicence : Codable {
    let errorCode : Int
    let errorMessage : String
    let data : [oldDrivingLicenceData]
}

struct oldDrivingLicenceData : Codable {
    let id, idProb, name, nameProb: String
        let dob, dobProb, nation, nationProb: String
        let address, addressProb, placeIssue, placeIssueProb: String
        let date, dateProb, datumClass, classProb: String
        let doe, doeProb, type: String

        enum CodingKeys: String, CodingKey {
            case id
            case idProb = "id_prob"
            case name
            case nameProb = "name_prob"
            case dob
            case dobProb = "dob_prob"
            case nation
            case nationProb = "nation_prob"
            case address
            case addressProb = "address_prob"
            case placeIssue = "place_issue"
            case placeIssueProb = "place_issue_prob"
            case date
            case dateProb = "date_prob"
            case datumClass = "class"
            case classProb = "class_prob"
            case doe
            case doeProb = "doe_prob"
            case type
        }
}
