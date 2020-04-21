import UIKit

//Diagonal Traverse
//Solution
//Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order as shown in the below image.
//
//
//
//Example:
//
//Input:
//[
// [ 1, 2, 3 ],
// [ 4, 5, 6 ],
// [ 7, 8, 9 ]
//]
//
//Output:  [1,2,4,7,5,3,6,8,9]
//
//Explanation:
//
//
//
//Note:
//
//The total number of elements of the given matrix will not exceed 10,000.


class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        var finalArray : [Int] = []
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
              print(i,j)
            }
        }
        return finalArray
    }
}

let sol : Solution = Solution()
print(sol.findDiagonalOrder([[ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ]]))

[0][0]
[0][1]
[1][0]
[2][0]
[1][1]
[0][2]
[1][2]
[2][1]
[2][2]



