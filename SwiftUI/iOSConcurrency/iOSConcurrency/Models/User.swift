//
//  User.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import Foundation

//Source : https://jsonplaceholder.typicode.com/users
struct User :Codable, Identifiable {
    let id : Int
    let name : String
    let username : String
    let email : String
}

