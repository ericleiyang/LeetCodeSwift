import Foundation

class Solution {
    func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        guard x != 0, y != 0 else {
            return z == 0
        }
        if z > x + y { return false }
        return z % gcd(x, y) == 0
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var ta = a > b ? a : b
        var tb = a < b ? a : b
        
        if ta % tb == 0 {
            return tb
        }else {
            return gcd(tb, ta % tb)
        }
    }
}
