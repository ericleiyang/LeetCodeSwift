import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root, let left = root.left, let right = root.right else {return false}
        
        var values = [Int]()
        
        self.midTraversal(values, root)
        
        return true
    }
    
    func midTraversal(_ values: inout [Int], _ node: TreeNode?) {
        guard let node = node else { return }
        
        midTraversal(&values, node.left)
        values.append(node.val)
        midTraversal(&values, node.right)
    }
}

struct TreeNode<T: Comparable> {
    var value: T
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: T, left: TreeNode?, right: TreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

struct BinaryTree<T: Comparable> {
    var head: TreeNode<T>?
    
    func addNode(_ node: TreeNode) {
        if let head = head {
            
        }
    }
}

struct BPlusTree {
    
}
