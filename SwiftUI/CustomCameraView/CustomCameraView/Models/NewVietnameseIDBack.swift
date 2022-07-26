//
//  NewVietnameseIDBack.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/25/22.
//

struct NewVietnameseIDBack: Codable, Hashable {
    let errorCode: Int
    let errorMessage: String
    let data: [Datumm]
}

// MARK: - Datum
struct Datumm: Codable, Hashable {
    let religionProb, religion, ethnicityProb, ethnicity: String
    let features, featuresProb, issueDate, issueDateProb: String
    let issueLOCProb, issueLOC, type: String

    enum CodingKeys: String, CodingKey, Hashable {
        case religionProb = "religion_prob"
        case religion
        case ethnicityProb = "ethnicity_prob"
        case ethnicity, features
        case featuresProb = "features_prob"
        case issueDate = "issue_date"
        case issueDateProb = "issue_date_prob"
        case issueLOCProb = "issue_loc_prob"
        case issueLOC = "issue_loc"
        case type
    }
}
