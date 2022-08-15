import Foundation
// Minimal tRee
// Given a sorted array with unique numbers, write a algorithm to create a binary tree with minimal height

func minitree(_ arr: [Int], firstIndex : Int, lastIndex:Int) -> Node? {
    if firstIndex > lastIndex {
        return nil
    }
    let middleIndex = (lastIndex - firstIndex) / 2 + firstIndex
    let node = Node(val: arr[middleIndex])
    node.leftChild = minitree(arr, firstIndex: firstIndex, lastIndex: middleIndex-1)
    node.rightChild = minitree(arr, firstIndex: middleIndex+1, lastIndex: lastIndex)
    
    
    return node
        
}


var array = [1,5,15,50,55,65,75]

class Node {
    var value : Int
    var leftChild : Node?
    var rightChild : Node?
    
    init(val :Int){
        self.value = val
    }
}

let result = minitree(array, firstIndex: 0, lastIndex: array.count - 1)
print(result?.value)
print(result?.rightChild?.value)
print(result?.leftChild?.value)
