import UIKit

//Minimum Path Sum
//Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
//
//Note: You can only move either down or right at any point in time.
//
//Example:
//
//Input:
//[
//  [1,3,1],
//  [1,5,1],
//  [4,2,1]
//]
//Output: 7
//Explanation: Because the path 1→3→1→1→1 minimizes the sum.

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        let row = grid.count
        let col = grid[0].count

        var memo = [[Int]](repeating: [Int].init(repeating: 0, count: col), count: row)
        for r in 0..<row {
            for c in 0..<col {
                if r==0 && c==0 {
                    memo[r][c] = grid[r][c]
                    continue
                }
                else if r == 0 {
                    memo[r][c] = grid[r][c] + memo[r][c-1]
                }
                else if c == 0 {
                    memo[r][c] = grid[r][c] + memo[r-1][c]
                }
                else {
                    memo[r][c] = grid[r][c] + min(memo[r-1][c], memo[r][c-1])
                }
            }
        }
        return memo[row-1][col-1]
    }
}

let sol = Solution()
print(sol.minPathSum([[1,3,1], [1,5,1], [4,2,1]]))
