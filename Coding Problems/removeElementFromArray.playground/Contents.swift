import Foundation


func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var indx = 0
    while (indx <= nums.count - 1){
        if (nums[indx] == val){
            nums.remove(at: indx)
        }
        else {
        indx += 1
        }
        }
        
    return nums.count
}


