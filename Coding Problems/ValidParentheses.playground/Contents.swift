import Cocoa
import Foundation
import Darwin


var s = "()[]}"

func isValid(_ s: String) -> Bool {
    if s.count < 2 {
        return false
    }
    
    var stack = [Character]()
    
    for char in s {
        if (char == "(" || char == "[" || char == "{") {
            stack.append(char)
        }
        else {
            if char == ")" {
                guard stack.count != 0 && stack.removeLast() == "(" else {
                    return false
                }
            }
            if char == "]" {
                guard stack.count != 0 && stack.removeLast()=="[" else {
                    return false
                }
            }
            if char == "}" {
                guard stack.count != 0 && stack.removeLast()=="{" else {
                    return false
                }
            }
        }
    }
        return true
    }

print(isValid(s))
