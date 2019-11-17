import UIKit

func nextPermutation(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    
    let n = nums.count
    
    var i = n - 1
    
    while i > 0 {
        var j = i - 1

        while j >= 0 {
            if nums[i] > nums[j] {
                let temp = nums[j]
                nums[j] = nums[i]
                nums[i] = temp
                
                return
            }else {
                j -= 1
            }
        }
        
        i -= 1
    }
    
    i = n - 1
    var j = 0
    
    while i > j {
        let temp = nums[j]
        nums[j] = nums[i]
        nums[i] = temp
        i -= 1
        j += 1
    }
}

var t = [1,2,3]
nextPermutation(&t)
