import Cocoa
import Foundation

extension Numeric{
    func squared() -> Self {
        self*self
    }
}

struct User:Equatable,Comparable {
    let name:String
    
    static func <(lhs:User,rhs : User) -> Bool {
        lhs.name < rhs.name
    }
}




let user1 = User(name: "TOMMY")
let user2 = User(name: "TIFF")
let user3 = User(name: "Abc")


print(user1 == user2)
print(user1 != user2)
print(user1 < user3)
