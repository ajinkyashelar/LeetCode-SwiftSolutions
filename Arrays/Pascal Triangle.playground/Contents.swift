import UIKit

//Pascal's Triangle
//Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 5
//Output:
//[
//     [1],
//    [1,1],
//   [1,2,1],
//  [1,3,3,1],
// [1,4,6,4,1]
//]

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        let start : Int = 1
        var result : [[Int]] = []

        for i in 0..<numRows {
            
            if i == 0 {
                result.append([start])
            }
            else if i == 1 {
                result.append([start, start])
            }
            else {
                var array : [Int] = []
                array.append(start)
                for j in 1..<i{
                    array.append((result[i-1][j-1] + result[i-1][j]))
                }
                array.append(start)
                result.append(array)
            }
        }
        return result
    }
}
let sol : Solution = Solution()
print(sol.generate(8))
