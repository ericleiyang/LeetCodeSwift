import Foundation

func lengthOfLastWord(_ s: String) -> Int {
    
    var count = 0
    for c in s.reversed() {
        if c != " " {
            count += 1
        }
        if c == " " && count != 0 {
            break
        }
    }
    return count
}


lengthOfLastWord("rewr rerew")
