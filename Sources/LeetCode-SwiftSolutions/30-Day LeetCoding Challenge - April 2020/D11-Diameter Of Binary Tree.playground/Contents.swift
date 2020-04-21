import UIKit
//Diameter of Binary Tree
//Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
//
//Example:
//Given a binary tree
//          1
//         / \
//        2   3
//       / \
//      4   5
//Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
//
//Note: The length of path between two nodes is represented by the number of edges between them.

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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let lHeight = height(root.left)
        let rHeight = height(root.right)
        
        let leftDiameter = diameterOfBinaryTree(root.left)
        let rightDiameter = diameterOfBinaryTree(root.right)
        
        return max(lHeight + rHeight, max(leftDiameter, rightDiameter))
    }
    
    func height(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return 1 + max(height(root.left), height(root.right))
    }
    
    // Best Solution
    private var result: Int = 0
    
    func diameterOfBinaryTreeResult(_ root: TreeNode?) -> Int {
        let _ = findMax(root)
        return result
    }
    
    private func findMax(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftMax = findMax(root.left)
        let rightMax = findMax(root.right)
        
        result = max(result, leftMax + rightMax)
        
        return max(leftMax, rightMax) + 1
    }
}
