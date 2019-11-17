import UIKit

func canJump(_ nums: [Int]) -> Bool {
    let n = nums.count
    var last = n - 1
    
    for var i in (0...(n - 2)).reversed() {
        if (i + nums[i] >= last) {
            last = i
        }
    }
    return last <= 0
}

canJump([3,2,1,0,4])
