import Foundation

struct Stack {
    private var temp = [String]()
    
    private var balanceIndex: Int = -1
    
    func peek(_ index: Int) ->  String? {
        guard temp.count > index else {
            return nil
        }
        
        return temp[index]
    }
    
    mutating func pop() -> String {
        return temp.removeFirst()
    }
    
    mutating func push(_ s: String) {
        temp.insert(s, at: 0)
    }
}

func lengthOfPalindrome(_ s: String, left: Int, right: Int){
    var l = left
    var r = right
    
    while l > 0, r < s.count, s.reversed()[l] == s[r] {
        
    }
}

func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    
    var stack = Stack()
    var result: String = ""
    var temp: String = ""
    for c in s {
        if stack.shouldPush(s) {
            stack.push(String(c))
        }else {
            if temp.count > result.count {
                result = temp
                temp.removeAll()
                stack = Stack()
            }
            stack.push(String(c))
            continue
        }
    }
    
    return result
}

longestPalindrome("bbbc")

