import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {

    if nums.count < 3 {
        return []
    }

    var result = Set<[Int]>()
    var sorted = nums.sorted()

    for i in 0..<sorted.count {
        var j = i + 1
        var k = sorted.count - 1

        while j < k {
            let sum = sorted[i] + sorted[j] + sorted[k]
            if sum == 0 {
                result.insert([sorted[i], sorted[j], sorted[k]])
                j += 1
            } else if sum < 0 {
                j += 1
            } else if sum > 0 {
                k -= 1
            }
        }
    }


    return Array(result)
}

threeSum([1,-2,1,0,3,-1,-4])
