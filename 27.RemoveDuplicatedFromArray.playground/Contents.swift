import UIKit

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

    var index: Int = 0
    
    for num in nums {
        if num != val {
            nums[index] = num
            index += 1
        }
    }

    return index
}


var nums = [1,2,2,3]
removeElement(&nums, 2)
