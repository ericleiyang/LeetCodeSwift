import Foundation

class Node<T: Comparable> {
    var value: T?
    var leftNode: Node<T>?
    var rightNode: Node<T>?
    
    init(_ value: T, _ leftNode: Node<T>?, _ rightNode: Node<T>?) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), \nleft: {\(left.description)}, \nright: {\(right.description)}"
        case .empty:
            return ""
        }
    }
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    var isBalanced: Bool {
        switch self {
        case let .node(left, _, right):
            return left.count == right.count
        case .empty:
            return true
        }
    }
    
    mutating func insert(_ newValue: T) {
        self = self.newTreeWithInsert(newValue)
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
    
    func traversaInOrder(process: (T) -> ()){//left first
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversaInOrder(process: process)
            process(value)
            right.traversaInOrder(process: process)
        }
    }
    
    func preOrderTraversal(process: (T) -> ()){
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.preOrderTraversal(process: process)
            right.preOrderTraversal(process: process)
        }
    }
    
    func afterOderTraversal(process: (T) -> ()){
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.preOrderTraversal(process: process)
            right.preOrderTraversal(process: process)
            process(value)
        }
    }
    
    func searchBinaryTree(_ searchValue: T) -> BinaryTree? {//search binary tree is quick as the left node is less than right
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }else if searchValue < value {
                return left.searchBinaryTree(searchValue)
            }else {
                return right.searchBinaryTree(searchValue)
            }
        }
    }
}

func test() {
    let node1 = BinaryTree.node(.empty, 1, .empty)
    let node2 = BinaryTree.node(.empty, 2, .empty)
    let node3 = BinaryTree.node(.empty, 3, node2)
    
    let tree = BinaryTree.node(node1, 0, node3)
    
    print(tree)
    print(tree.count)
    print(tree.isBalanced)
    
    var tree1 = BinaryTree.node(.empty, 3, .empty)
    tree1.insert(4)
    tree1.insert(2)
    tree1.insert(7)
    tree1.insert(1)
    print(tree1)
    print(tree1.isBalanced)
    
    if let result = tree1.searchBinaryTree(1) {
        switch result {
        case let .node(left, value, right):
            print(left)
            print(value)
            print(right)
            
        default:
            print("")
        }
    }
}

test()

func subString(_ s: String) {
    
}



