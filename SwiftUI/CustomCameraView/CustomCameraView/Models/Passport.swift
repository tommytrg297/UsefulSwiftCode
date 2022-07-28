//
//  Passport.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/26/22.
//


import Foundation

// MARK: - Welcome
struct Passport : Codable {
    let errorCode: Int
    let errorMessage: String
    let data: [Datum]
}

// MARK: - Passport data
struct PassportData: Codable {
    let passportNumber, passportNumberProb, name, nameProb: String
    let pob, pobProb, sex, sexProb: String
    let idNumber, idNumberProb, doi, doiProb: String
    let doe, doeProb: String

    enum CodingKeys: String, CodingKey {
        case passportNumber = "passport_number"
        case passportNumberProb = "passport_number_prob"
        case name
        case nameProb = "name_prob"
        case pob
        case pobProb = "pob_prob"
        case sex
        case sexProb = "sex_prob"
        case idNumber = "id_number"
        case idNumberProb = "id_number_prob"
        case doi
        case doiProb = "doi_prob"
        case doe
        case doeProb = "doe_prob"
    }
}
