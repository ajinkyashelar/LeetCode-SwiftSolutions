import UIKit

//Number of Islands
//Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
//Example 1:
//
//Input:
//11110
//11010
//11000
//00000
//
//Output: 1
//
//Example 2:
//
//Input:
//11000
//11000
//00100
//00011
//
//Output: 3

class Solution {

    func numIslands(_ grid: [[Character]]) -> Int {
        
        guard grid.count > 0 else { return 0 }
        guard grid[0].count > 0 else { return 0 }

        var matrix = grid
        var numberOfIslands = 0
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == "1" {
                    numberOfIslands += 1
                    changeElement(&matrix, i, j)
                }
            }
        }
        return numberOfIslands
    }
    
    private func changeElement(_ matrix: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0, i < matrix.count, j >= 0, j < matrix[0].count, matrix[i][j] == "1" else { return }
        matrix[i][j] = "0"
        changeElement(&matrix, i + 1, j)
        changeElement(&matrix, i - 1, j)
        changeElement(&matrix, i, j + 1)
        changeElement(&matrix, i, j - 1)
    }
}

let sol : Solution = Solution()
print(sol.numIslands([["1","1","0","0","0"], ["1","1","0","0","0"], ["0","0","1","0","0"], ["0","0","0","1","1"]]))
