import Foundation
import UIKit

// time : O(n) where n is the number of elements in matrix
// space : O (mn) where mn = col * row

func spiralTraverse(matrix : [[Int]]) -> [Int] {
    if matrix.isEmpty {
        return []
    }
    
    let total = matrix.count * matrix[0].count // rows * columns
    var res:[Int]  = [] // or Array(reapting:nil,Count:total)
    var left = 0
    var top = 0
    var right = matrix[0].count - 1
    var bottom = matrix.count - 1
    while res.count < total {
        // go left to right
        for col in stride(from: left,
                          through: right,
                          by: 1) {
                res.append(matrix[top][col])
            print(matrix[top][col])
        }
        // go top to bottom
        for row in stride(from: top+1,
                          through: bottom,
                          by: 1) {
                res.append(matrix[row][right])
            print(matrix[row][right])
        }
        // go from right to elft
        for col in stride(from: right-1,
                          through: left,
                          by: -1) {
                res.append(matrix[bottom][col])
        }
        // go down to up
        for row in stride(from: bottom-1,
                          through: top+1,
                          by: -1) {
                res.append(matrix[row][left])
        }
        // go down
        // go left
        // go up
        left+=1
        top+=1
        right-=1
        bottom-=1
    }
    return res
}
let matrix = [[1,2,3],[4,5,6],[7,8,9]]
spiralTraverse(matrix: matrix)

