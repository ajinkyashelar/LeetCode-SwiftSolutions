import UIKit

//Leftmost Column with at Least a One
//
//(This problem is an interactive problem.)
//
//A binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.
//
//Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.
//
//You can't access the Binary Matrix directly.  You may only access the matrix using a BinaryMatrix interface:
//
//BinaryMatrix.get(x, y) returns the element of the matrix at index (x, y) (0-indexed).
//BinaryMatrix.dimensions() returns a list of 2 elements [n, m], which means the matrix is n * m.
//Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.
//
//For custom testing purposes you're given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.
//
//
//
//Example 1:
//
//
//
//Input: mat = [[0,0],[1,1]]
//Output: 0
//Example 2:
//
//
//
//Input: mat = [[0,0],[0,1]]
//Output: 1
//Example 3:
//
//
//
//Input: mat = [[0,0],[0,0]]
//Output: -1
//Example 4:
//
//
//
//Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
//Output: 1
//
//
//Constraints:
//
//1 <= mat.length, mat[i].length <= 100
//mat[i][j] is either 0 or 1.
//mat[i] is sorted in a non-decreasing way.
//
//mat[i] is sorted in a non-decreasing way.
//   Hide Hint #1
//1. (Binary Search) For each row do a binary search to find the leftmost one on that row and update the answer.
//   Hide Hint #2
//2. (Optimal Approach) Imagine there is a pointer p(x, y) starting from top right corner. p can only move left or down. If the value at p is 0, move down. If the value at p is 1, move left. Try to figure out the correctness and time complexity of this algorithm.

// *  This is the BinaryMatrix's API interface.
// *  You should not implement it, or speculate about its implementation
 public class BinaryMatrix {
     public func get(_ x: Int, _ y: Int) -> Int {}
     public func dimensions() -> [Int] {}
 };
 

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        
        let dimensions : [Int] = binaryMatrix.dimensions()
        let n : Int = dimensions[0]
        let m : Int = dimensions[1]
        print("n rows",n)
        print("m columns",m)
        var rowIndex = 0
        var colIndex = m-1
        var colIndex1 = -1
        for i in 0..<(m+n) {
            let val : Int = binaryMatrix.get(rowIndex, colIndex)
            print(val,rowIndex,colIndex)
            if val == 1 {
                print("left")
                colIndex1 = colIndex
                colIndex = colIndex-1
                if colIndex == -1 {
                    break
                 }
            }
            else{
                print("down")
                rowIndex = rowIndex+1
                if rowIndex == n {
                    break
                }
            }
        }
        return colIndex1
    }
}
