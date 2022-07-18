//
//  SecretsManager.swift
//  SecretsFramework
//
//  Created by Truong Tommy on 7/15/22.
//

import Foundation

public class SecretsManager {
    private var isAuthorized : Bool
    
    public init(key:String){
        self.isAuthorized = Approved.keys.contains(key) ? true : false
    }
    
    public func readSecret() -> String? {
        isAuthorized ? "I love custom framework" : nil
    }
}


private struct Approved {
    static let keys = ["12345","asdfg"]
}
