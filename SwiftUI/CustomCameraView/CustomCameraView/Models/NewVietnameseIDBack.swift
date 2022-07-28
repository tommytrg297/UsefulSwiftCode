//
//  NewVietnameseIDBack.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/25/22.
//

struct NewVietnameseIDBack: Codable, Hashable {
    let errorCode: Int
    let errorMessage: String
    let data: [NewVietnameseIDBackData]
}

// MARK: - Datum
struct NewVietnameseIDBackData: Codable, Hashable {

    let features, featuresProb, issueDate, issueDateProb: String
    let type: String

    enum CodingKeys: String, CodingKey, Hashable {
        case features
        case featuresProb = "features_prob"
        case issueDate = "issue_date"
        case issueDateProb = "issue_date_prob"
        case type
    }
}
