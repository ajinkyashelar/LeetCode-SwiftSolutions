import UIKit

//Cousins in Binary Tree
//In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
//
//Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
//
//We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
//
//Return true if and only if the nodes corresponding to the values x and y are cousins.
//
//
//
//Example 1:
//
//
//Input: root = [1,2,3,4], x = 4, y = 3
//Output: false
//Example 2:
//
//
//Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
//Output: true
//Example 3:
//
//
//
//Input: root = [1,2,3,null,4], x = 2, y = 3
//Output: false
//
//
//Note:
//
//The number of nodes in the tree will be between 2 and 100.
//Each node has a unique integer value from 1 to 100.

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
class Solution16ms {
    var dict : [Int:String] = [:]
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        
        dfs(root, 0, parentVal: root!.val)
        
        let xStr: String = dict[x]!
        let yStr: String = dict[y]!
        let xArr: [String] = xStr.components(separatedBy: ",")
        let yArr: [String] = yStr.components(separatedBy: ",")
        
        var xDepth = ""
        var xParent = ""
        
        var yDepth = ""
        var yParent = ""
        
        if xArr.count > 1 {
            xDepth = xArr[0]
            xParent = xArr[1]
        }
        
        if yArr.count > 1 {
            yDepth = yArr[0]
            yParent = yArr[1]
        }
        
        print("xDepth: ", xDepth)
        print("yDepth: ", yDepth)
        print("xParent: ", xParent)
        print("yParent: ", yParent)
        
        
        if xDepth == yDepth && xParent != yParent {
            return true
        }
        
        print(dict)
        
        return false
        
    }
    
    func dfs(_ root: TreeNode?,_ depth: Int, parentVal: Int) {
        if root == nil {
            return
        }
        let depthIn = depth + 1
        let val = root?.val ?? 0
        dict[val] = String("\(depthIn),\(parentVal)")
        if root?.left != nil {
            dfs(root?.left, depthIn, parentVal: root!.val)
        }
        if root?.right != nil {
            dfs(root?.right, depthIn, parentVal: root!.val)
        }
    }
}


class Solution12ms {
   func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
         guard  let root = root else {
             return false
         }
         
         func dfs(_ root: TreeNode?,_ depth: Int, parentVal: Int, val: Int) -> [Int]{
             guard  let root = root else {
                 return [0,0]
             }
             if root.val == val {
                 return [depth + 1, parentVal]
             }
             let leftSearch = dfs(root.left, depth + 1, parentVal: root.val, val: val)
             
             if !leftSearch.isEmpty {
                 return leftSearch
             }
             else {
                 return dfs(root.right, depth + 1, parentVal: root.val, val: val)
             }
         }
        
         let leftArr = dfs(root, 0, parentVal: root.val, val: x)
         let rightArr = dfs(root, 0, parentVal: root.val, val: y)
                
         if leftArr[0] == rightArr[0] && leftArr[1] != rightArr[1] {
             return true
         }
         return false
     }
}
