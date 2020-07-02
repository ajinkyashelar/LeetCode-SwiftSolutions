import UIKit

//Binary Tree Level Order Traversal II
//
//Solution
//Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
//
//For example:
//Given binary tree [3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its bottom-up level order traversal as:
//[
//  [15,7],
//  [9,20],
//  [3]
//]


//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[Int]]() }
        var levelList = [[root.val]]
        var queue = [root]
        
        while queue.count > 0 {
            var level = [Int]()
            var newQueue = [TreeNode]()
            for node in queue {
                if let left = node.left {
                    level.append(left.val)
                    newQueue.append(left)
                }
                if let right = node.right {
                    level.append(right.val)
                    newQueue.append(right)
                }
            }
            if level.count > 0 {
                levelList.append(level)
            }
            queue = newQueue
        }
        return levelList.reversed()
    }
}
