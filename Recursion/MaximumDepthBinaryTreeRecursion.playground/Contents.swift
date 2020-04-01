import UIKit
//Given a binary tree, find its maximum depth.
//
//The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given binary tree [3,9,20,null,null,15,7],
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its depth = 3.

//Maximum Depth of Binary Tree
//Definition for a binary tree node.

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
    func maxDepth(_ root: TreeNode?) -> Int {
        if root?.val == nil {
            return 0
        }
        else {
            return max(1 + maxDepth(root?.left), 1 + maxDepth(root?.right))
        }
    }
}

