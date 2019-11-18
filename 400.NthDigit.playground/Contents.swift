import UIKit

func findNthDigit(_ n: Int) -> Int {
    var str: String = ""
    var i = 1
    while str.count < n {
        str.append(String(i))
        i += 1
    }
    print(str)
    
    let left = str.index(str.startIndex, offsetBy: n-1)
    let right = str.index(str.startIndex, offsetBy: n)
    let s = str[left..<right]
    return Int(String(s))!
}

findNthDigit(100000)
