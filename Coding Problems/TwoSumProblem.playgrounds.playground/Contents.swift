import Cocoa
import Foundation
import Darwin


var numbers = [1,3,6,6,7,7,12,14]

func twoSum1  (input:[Int],value:Int) -> Bool {
    for i in 0..<input.count {
        for j in 0..<input.count where j != i {
            
            if (input[i]+input[j] == value) {
                print("\(input[i])+\(input[j]) gives \(value)")
                return true
            }
            else {
                print("\(input[i])+\(input[j]) does not give \(value)")
            }
        }
    }
    return false
}

func twoSum2  (input:[Int],value:Int) -> Bool {
    for i in 0..<input.count {
        let compliment = value - input[i]
        var tempArray = input
        tempArray.remove(at: i)
        var result =  binarySearch(array: tempArray, key: compliment)
        if (result == true) {
            return true
        }
    }
    return false
}

func twoSum3  (input:[Int],value:Int) -> Bool {
    var indStart = 0
    var indEnd = input.count - 1
    
    while (indEnd > indStart) {
        let sumOfIndex = input[indStart]+input[indEnd]
        
        if (sumOfIndex == value) {
            return true
        }
        else if sumOfIndex < value {
            indStart+=1
        }
        else if sumOfIndex > value{
            indEnd-=1
        }
    }
    return false
}

print(twoSum3(input: numbers, value: 5))

func binarySearch(array:[Int],key:Int) -> Bool{
    if array.count == 0 {
        return false
    }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex/2
    let midValue = array[midIndex]
    
    if (key < array[minIndex] || key > array[maxIndex]){
        
        return false
    }
    if (key > midValue) {
        let slice =  Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    if (key < midValue) {
        let slice = Array(array[minIndex...midIndex-1])
        return binarySearch(array: slice, key: key)
    }
    if (key == midValue){
        
        return true
    }
    return false
}
