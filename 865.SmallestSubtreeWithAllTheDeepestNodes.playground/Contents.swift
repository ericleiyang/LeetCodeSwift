import UIKit

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }

        let left = findDeepest(root.left, 1)
        let right = findDeepest(root.right, 1)
        
        if left == right {
            return root
        }else if left < right {
            return subtreeWithAllDeepest(root.right)
        }else {
            return subtreeWithAllDeepest(root.left)
        }
    }
    
    func findDeepest(_ root: TreeNode?, _ deepth: Int) -> Int {
        guard let root = root else {
            return deepth
        }
        
        let left = findDeepest(root.left, deepth + 1)
        let right = findDeepest(root.right, deepth + 1)
        
        let maxl = max(left, right)
        return maxl
    }
}
