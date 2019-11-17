import UIKit

func climbStairs(_ n: Int) -> Int {
    guard n > 2 else {
        return n
    }
    
    var i = 2
    
    var step1 = 1
    var step2 = 2
    var steps = 0
    while i < n {
        steps = step1 + step2
        step1 = step2
        step2 = steps
        
        i += 1
    }
    
    return steps
}

climbStairs(3)
