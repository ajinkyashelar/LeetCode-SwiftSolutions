import UIKit

//Maximal Square
//
//Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
//
//Example:
//
//Input:
//
//1 0 1 0 0
//1 0 1 1 1
//1 1 1 1 1
//1 0 0 1 0
//
//Output: 4

class Solution {
    // DP solution with time complexity of O(mn) & space complexity of O(mn)
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        var maxSql: Int = 0
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count+1), count: matrix.count+1)
        for i in 1..<matrix.count+1 {
            for j in 1..<matrix[0].count+1 {
                print("i", i, "j", j)
                if matrix[i-1][j-1] == "1" {
                    print("is 1")
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                    print(dp[i][j])
                    maxSql = max(maxSql, dp[i][j])
                }
                
            }
        }
        return maxSql * maxSql
    }
    
    // DP solution with space efficient approach time complexity of O(mn) & space complexity of O(n)
    func maximalSquareSpaceEfficient(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        var maxSql: Int = 0
        var dp: [Int] = Array(repeating: 0, count: matrix[0].count+1)
        var prev = 0
        for i in 1..<matrix.count+1 {
            for j in 1..<matrix[0].count+1 {
                print("i", i, "j", j)
                let temp = dp[j]
                print("temp", temp, "prev", prev)
                if matrix[i-1][j-1] == "1" {
                    print("is 1")
                    dp[j] = min(dp[j], dp[j-1], prev) + 1
                    print(dp[j])
                    maxSql = max(maxSql, dp[j])
                }
                else {
                    dp[j] = 0
                }
                prev = temp
            }
        }
        return maxSql * maxSql
    }
}

let sl = Solution()
//print(sl.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","1","1","1"]]))
print(sl.maximalSquareSpaceEfficient([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","1","1","1"]]))
