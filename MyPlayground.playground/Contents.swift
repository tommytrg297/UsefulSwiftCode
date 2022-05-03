import Foundation
import Darwin


var x1 = [1,2,3,4,5,6,7,8,9,10]


for i in 0..<x1.count {
    if (x1[i] == 5) {
        x1.insert(69, at: i-1)
    }
}

print(x1)
