import UIKit

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    var indexs = [Int]()
    guard words.count > 0 else {return indexs }
    
    var temp = [String: [Int]]()
    
    var i = 0
    let length = words.first!.count
    var end = i + length
    
    while end < s.count {
        let left = s.index(s.startIndex, offsetBy: i)
        let right = s.index(s.startIndex, offsetBy: end)
        
        let subString = String(s[left..<right])
        
        if var positions = temp[subString] {
            positions.append(i)
            temp[subString] = positions
        }else {
            var positions = [Int]()
            positions.append(i)
            temp[subString] = positions
        }
        
        i += length
        end = i + length
    }
    
    for word in words {
        if let posistion = temp[word] {
            
        }
    }
    
}
