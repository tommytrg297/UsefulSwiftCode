//
//  Post.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import Foundation

//Source : https://jsonplaceholder.typicode.com/posts

struct Post : Codable, Identifiable {
    let userId : Int
    let id : Int
    let title : String
    let body   : String
}
