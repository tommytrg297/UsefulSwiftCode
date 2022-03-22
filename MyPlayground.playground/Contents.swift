import Cocoa
import Foundation
import Darwin


func getUser() -> (String,String) {
    ("Tammy","Taylor")
}


let (firstname,_) = getUser()

print(firstname)
