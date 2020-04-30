import UIKit

//Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree
//Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree.
//
//We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.
//
//
//
//Example 1:
//
//
//
//Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,0,1]
//Output: true
//Explanation:
//The path 0 -> 1 -> 0 -> 1 is a valid sequence (green color in the figure).
//Other valid sequences are:
//0 -> 1 -> 1 -> 0
//0 -> 0 -> 0
//Example 2:
//
//
//
//Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,0,1]
//Output: false
//Explanation: The path 0 -> 0 -> 1 does not exist, therefore it is not even a sequence.
//Example 3:
//
//
//
//Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,1]
//Output: false
//Explanation: The path 0 -> 1 -> 1 is a sequence, but it is not a valid sequence.
//
//
//Constraints:
//
//1 <= arr.length <= 5000
//0 <= arr[i] <= 9
//Each node's value is between [0 - 9].
//   Hide Hint #1
//Depth-first search (DFS) with the parameters: current node in the binary tree and current index in the array of integers.
//   Hide Hint #2
//When reaching at final index check if it is a leaf node.


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
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        var isValid: Bool = false
        guard let root = root else {
            return false
        }
        if arr.count != 0  {
            isValid = DFS(root, 0, arr)
        }
        
        return isValid
    }
    
//    func DFS(_ root: TreeNode?,_ index: Int, _ arr: [Int]) -> Bool {
//
//        guard let root = root else {
//            return false
//        }
//        print("index:", index)
//        if index < arr.count-1 {
//            if root.val == arr[index] {
//                print("root.val == arr[index] == true ", root.val)
//                let left = DFS(root.left, index + 1, arr)
//                let right = DFS(root.right, index + 1, arr)
//                if left || right  {
//                    print("true")
//                    return true
//                }
//            }
//        }
//        else {
//             if root.val == arr[index] && root.left == nil && root.right == nil {
//                 return true
//             }
//            else {
//                return false
//            }
//        }
//        return false
//    }
    
    func DFS(_ root: TreeNode?,_ index: Int, _ arr: [Int]) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.val == arr[index] && root.left == nil && root.right == nil && index == arr.count-1 {
            return true
        }
        
        return index < arr.count-1 && root.val == arr[index] && (DFS(root.left, index + 1, arr) || DFS(root.right, index + 1, arr))
    }
}


class SolutionFinal {
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {

        return DFS(root, 0, arr)
    }
    
    func DFS(_ root: TreeNode?,_ index: Int, _ arr: [Int]) -> Bool {
        // If root is null
        guard let root = root else {
            return false
        }
        // If this node is a leaf and matches with last entry of array.
        if root.val == arr[index] && root.left == nil && root.right == nil && index == arr.count-1 {
            return true
        }
        // If current node is equal to arr[index] this means
        // that till this level path has been matched and
        // remaining path can be either in left subtree or
        // right subtree.
        // to check either left or right nodes full fill the valid sequence.
        return index < arr.count-1 && root.val == arr[index] && (DFS(root.left, index + 1, arr) || DFS(root.right, index + 1, arr))
    }
}
