import Foundation

//Time complexity: O(n)
//Space complexity: O(n)
func twoSum(nums: [Int], target: Int) -> [Int]? {
    var dict = [Int: Int]()
    
    for (index, num) in nums.enumerated() {
        if let cached = dict[target - num], let indexOfCached = nums.firstIndex(of: cached) {
            return [indexOfCached, index]
        }
        dict[num] = num
    }

    return nil
}

twoSum(nums: [1,10,20,2,3,33,4,5,9], target: 12)
