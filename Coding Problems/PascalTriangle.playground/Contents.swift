import Cocoa
import Foundation
import Darwin

var numRows = 4

func pascalTriangle(_ numrows:Int) -> [[Int]] {
    guard numrows > 0 else {
        return []
    }
    if numrows == 1 {return [[1]]}
    
    var result = [[Int]]()
    result.append([1])
    
    for i in 1..<numrows {
        var newRow = [1]
        let prevRow = result[i-1]
        for j in 0..<prevRow.count-1 {
            newRow.append(prevRow[j]+prevRow[j+1])
        }
        newRow.append(1)
        result.append(newRow)
    }
    return result
}

let answer = pascalTriangle(8)
for row in answer {
    print(row)
}


