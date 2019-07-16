import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let temp = (l1 ?? l2) else {
        return nil
    }
    
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0)
    temp.val = sum % 10
    
    if sum / 10 > 0 {
        if let next = temp.next {
            next.val += sum / 10
        }else {
            let next = ListNode(sum / 10)
            temp.next = next
        }
    }
    
    temp.next = addTwoNumbers(l1?.next, l2?.next)
    
    return temp
}

let l11 = ListNode.init(0)
let l12 = ListNode.init(4)
let l13 = ListNode.init(3)
l11.next = l12
l12.next = l13

let l21 = ListNode.init(5)
let l22 = ListNode.init(6)
let l23 = ListNode.init(4)
l21.next = l22
l22.next = l23

addTwoNumbers(l11, l21)
