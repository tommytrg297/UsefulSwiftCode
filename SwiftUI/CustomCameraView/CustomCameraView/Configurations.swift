//
//  Configurations.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/19/22.
//

import SwiftUI

class Configuration : Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var APIKey : String
    @Published var OCRType : OCRType
    @Published var OCRDocument : OCRDocumentType
    @Published var captureMode : OCRModeType
    @Published var color : Color
    @Published var showFinalScreenResult : Bool
    @Published var submitResultToFPTServer : Bool
    
    init(APIKey : String, OCRType : OCRType, OCRDocument : OCRDocumentType, captureMode : OCRModeType,
         color : Color, showFinalScreenResult : Bool, submitResultToFPTServer : Bool) {
        self.APIKey = APIKey
        self.OCRType = OCRType
        self.OCRDocument = OCRDocument
        self.captureMode = captureMode
        self.color = color
        self.showFinalScreenResult = showFinalScreenResult
        self.submitResultToFPTServer = submitResultToFPTServer
    }
}

enum OCRType : String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case photo
    case video
}

enum OCRDocumentType : String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue.capitalized
    }
    case identityCard
    case driversLicense
    case passport
    case CMND
    case CCCD
}

enum OCRModeType : String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case autoDetect
    case manual
}


