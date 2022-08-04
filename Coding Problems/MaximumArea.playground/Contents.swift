import Foundation
//time : O(n)
// Space : O(1)
func maximumArea(_ height : [Int]) -> Int {
    if height.isEmpty {
        return -1
    }
    var maxArea = 0
    // move them based on criteria
    var left = 0
    var right = height.count - 1
    while (right > left) {
        // current area
        let minHeight = min(height[left],height[right])
        let currentArea = minHeight * (right-left)
        maxArea = max(currentArea, maxArea)
        print(maxArea)
        
        // move pointers
        if height[left] < height[right]{
            left+=1
        }
        else {
            right-=1
        }
    }
    return maxArea
}

let input = [1,8,6,2,5,4,8,3,7]
let input2 = [1,2,3,4,5,6,7]
let input3 = [Int]()
let result = maximumArea(input2)
print("Result : \(result)\n\n")
