import UIKit


class Stack<T: Comparable> {
    private var data = [T]()
    
    func push(_ element: T) {
        data.insert(element, at: 0)
    }
    
    func pop() -> T? {
        return data.removeFirst()
    }
    
    func peek() -> T? {
        guard data.count > 0 else { return nil }
        
        return data.first
    }
    
    func getAllReversed() -> [T] {
        return data.reversed()
    }
    
    func getCount() -> Int {
        return data.count
    }
}


func removeDuplicates(_ nums: inout [Int]) -> Int {
    let stack = Stack<Int>()
    
    for num in nums {
        if let peek = stack.peek() {
            if peek != num {
                stack.push(num)
            }
        }else {
            stack.push(num)
        }
    }
    
    nums = stack.getAllReversed()
    
    return stack.getCount()
}

var nums = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates(&nums)

