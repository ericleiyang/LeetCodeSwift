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
