import Cocoa
import Foundation
import Darwin

struct Person {
    let firstName :String
    let lastName:String
    let middleName:String?
}

let tommy = Person(firstName: "Tommy", lastName: "Truong",middleName: nil )

let firstletter = tommy.middleName?.first

