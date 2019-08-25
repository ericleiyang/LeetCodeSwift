import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public func description() {
        var temp: ListNode?
        temp = self
        while temp != nil {
            print(temp!.val)
            temp = temp!.next
        }
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }

    if l1!.val < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    }else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}


func merge() {
    let l1 = ListNode(1)
    let l12 = ListNode(2)
    let l13 = ListNode(3)
    
    l12.next = l13
    l1.next = l12
    
    let l2 = ListNode(1)
    let l22 = ListNode(3)
    let l23 = ListNode(4)
    
    l22.next = l23
    l2.next = l22
    
    if let l = mergeTwoLists(l1, l2) {
        l.description()
    }
}


merge()
