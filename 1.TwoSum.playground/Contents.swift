import Foundation

//Time complexity: O(n)
//Space complexity: O(n)
func twoSum(nums: [Int], target: Int) -> [Int]? {
    var dict = [Int: Int]()
    
    for (index, num) in nums.enumerated() {
        if let cached = dict[target - num], let indexOfCached = nums.firstIndex(of: cached) {
            return [index, indexOfCached]
        }
        dict[num] = num
    }

    return nil
}

twoSum(nums: [1,10,20,2,3,33,4,5,9], target: 12)


//Time complexity: O(n log n)
//Space complexity: O(log n)
func twoSum(numbers: [Int], target: Int) -> [Int]? {
    
    let nums = numbers.sorted()
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let sum = nums[left] + nums[right]
    
        if sum < target {
            left += 1
        }else if sum == target {
            if let originLeft = numbers.firstIndex(of: nums[left]), let originRight = numbers.firstIndex(of: nums[right]) {
                return [originLeft, originRight]
            }
        }else {
            right -= 1
        }
    }
    
    return nil
}

twoSum(numbers: [1,10,20,2,3,33,4,5,9], target: 12)
