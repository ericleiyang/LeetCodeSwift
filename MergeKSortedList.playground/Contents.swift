import UIKit

class Node<T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?
    
    init(_ value: T, _ left: Node?, _ right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

extension BinaryTree {
    func insert(_ value: T) -> BinaryTree {
        return self.newTreeWithInsert(value)
    }
    
    private func newTreeWithInsert(_ newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if value > newValue {
                return .node(left.newTreeWithInsert(newValue), value, right)
            }else {
                return .node(left, value, right.newTreeWithInsert(newValue))
            }
        }
    }
    
    func traversaInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversaInOrder(process: process)
            process(value)
            right.traversaInOrder(process: process)
        }
    }
    
}

protocol StackProtocol {
    associatedtype T
    
    func peek(_ index: Int) -> T?
    mutating func pop() -> T?
    mutating func push(_ value: T)
}

struct Stack: StackProtocol {
    typealias T = String
    
    private var values = [T]()
    
    func peek(_ index: Int) -> String? {
        guard index < values.count else {
            return nil
        }
        return values[index]
    }
    
    mutating func pop() -> String? {
        return values.removeFirst()
    }
    
    mutating func push(_ value: String) {
        values.insert(value, at: 0)
    }
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var bTree: BinaryTree<Int>? = nil
        
        for list in lists {
            var head: ListNode? = list

            while head != nil {
                if bTree == nil {
                    bTree = BinaryTree.node(.empty, head!.val, .empty)
                }else {
                    bTree = bTree!.insert(head!.val)
                }
                
                head = head?.next
            }
        }
        
        var sorted: ListNode? = nil
        var temp: ListNode? = nil
        bTree?.traversaInOrder(process: { (value) in
            print(value)
            if sorted == nil {
                sorted = ListNode.init(value)
                temp = sorted
            }else {
                temp?.next = ListNode.init(value)
                temp = temp?.next
            }
        })
        
        return sorted
    }
}

func test() {
    let ln11 = ListNode.init(1)
    let ln12 = ListNode.init(4)
    let ln13 = ListNode.init(5)
    
    ln11.next = ln12
    ln12.next = ln13
    
    let ln21 = ListNode.init(1)
    let ln22 = ListNode.init(3)
    let ln23 = ListNode.init(4)
    
    ln21.next = ln22
    ln22.next = ln23
    
    let ln31 = ListNode.init(2)
    let ln32 = ListNode.init(6)
    
    ln31.next = ln32
    
    
    Solution().mergeKLists([ln11, ln21, ln31])

}

test()
