//
//  MyColor.swift
//  ModifySwiftPackage
//
//  Created by Truong Tommy on 7/6/22.
//

import Foundation
import SwiftUI

struct myColor {
    var name : String
    var color: Color
    
    static var mockColors : [myColor]  {
        [myColor(name: "Red", color: .red),
         myColor(name: "Blue", color: .blue),
         myColor(name: "Green", color: .green)
        ]
    }
}
