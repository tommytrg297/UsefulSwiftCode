import Foundation

// given n, find the binary gap
// max number of consecutive zeros in between 2 ones

// 6 -> 110 , binary gap is 0
// 9 -> 1001 , binary gap is 2
// 145 -> 10010001, binary gap is 3

func binaryGap(_ n : Int) -> Int {
    var res = 0
    
    
    return res
}

var binaryGap = 0
var tempZeros = 0





var number:Int = 145

//let binary = String(number, radix: 2)
var binary2 : Int {
    var product = 1
    var res = 0
    var n = number
    while n != 0 {
        let remainder = n%2
        res += remainder * product
        n = n/2
        product = product * 10
    }
    return res
}
print(binary2)

//for i in binary {
//    if i == "0" {
//        tempZeros += 1
//    }
//    else if i == "1" {
//        if tempZeros > binaryGap {
//            binaryGap = tempZeros
//        }
//        tempZeros = 0
//    }
//}
//
//print(binaryGap)





