import UIKit

//Construct Binary Search Tree from Preorder Traversal
//Return the root node of a binary search tree that matches the given preorder traversal.
//
//(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)
//
//
//
//Example 1:
//
//Input: [8,5,1,7,10,12]
//Output: [8,5,10,1,7,null,12]
//
//
//
//Note:
//
//1 <= preorder.length <= 100
//The values of preorder are distinct.


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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var stack = [TreeNode]()
        var tree : TreeNode?
        var i = 1
        if preorder.count > 0 {
            tree = TreeNode(preorder[0])
            stack.append(tree!)
        }
        while i < preorder.count {
            let node = TreeNode(preorder[i])
            if preorder[i] < preorder[i-1] { // Left
                stack.last?.left = node
            }
            else {                          //Right
                var prev = stack.last
                while !stack.isEmpty, let val = stack.last?.val, val < preorder[i] {// Go to root to add right
                    prev = stack.popLast()
                }
                prev?.right = node
            }
            stack.append(node)
            i += 1
        }
        return tree
    }
    
    //4ms
    func bstFromPreorderBest(_ preorder: [Int]) -> TreeNode? {
        if preorder.isEmpty { return nil }
        
        let treeNode = TreeNode(preorder[0])
        
        for i in 1..<preorder.count {
            let val = preorder[i]
            insert(val, to: treeNode)
        }
        
        return treeNode
    }
    
    func insert(_ val: Int, to tree: TreeNode) {
        if val < tree.val {
            if let left = tree.left {
                insert(val, to: left)
            } else {
                tree.left = TreeNode(val)
            }
            
        } else if val > tree.val {
            if let right = tree.right {
                insert(val, to: right)
            } else {
                tree.right = TreeNode(val)
            }
        }
    }
}

let sol = Solution()
print(sol.bstFromPreorder([8,5,1,7,10,12])!)
