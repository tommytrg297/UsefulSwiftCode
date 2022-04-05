import Cocoa
import Foundation
import Darwin


var myarray = [7,3,1,8,5,4,2,6]

func mergesort(_ array:[Int])-> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    let leftarray = Array(array[0..<array.count/2])
    let rightarray = Array(array[array.count/2..<array.count])

    return merge(mergesort(leftarray), mergesort(rightarray))
}

func merge(_ array1:[Int],_ array2:[Int]) -> [Int] {
    var mergedArray:[Int] = []
    var left = array1
    var right = array2
    
    while (left.count > 0 && right.count > 0 ) {
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        }
        else {
            mergedArray.append(right.removeFirst())
        }
    }
    return mergedArray + left + right
}

print(myarray)
print()
print(mergesort(myarray))

