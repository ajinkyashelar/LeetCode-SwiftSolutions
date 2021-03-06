import UIKit

//Find Pivot Index
//Solution
//Given an array of integers nums, write a method that returns the "pivot" index of this array.
//
//We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.
//
//If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.
//
//Example 1:
//
//Input:
//nums = [1, 7, 3, 6, 5, 6]
//Output: 3
//Explanation:
//The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
//Also, 3 is the first index where this occurs.
//
//
//Example 2:
//
//Input:
//nums = [1, 2, 3]
//Output: -1
//Explanation:
//There is no index that satisfies the conditions in the problem statement.
//
//
//Note:
//
//The length of nums will be in the range [0, 10000].
//Each element nums[i] will be an integer in the range [-1000, 1000].

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {
            return -1
        }
        var sumLeft : Int = 0
        var sumRight : Int = 0
        for i in 0..<nums.count {
            if i != 0 {
                sumLeft = sumLeft + nums[i-1]
            }
            for j in i+1..<nums.count {
                sumRight = sumRight + nums[j]
            }
            
            if sumLeft == sumRight{
                return i
            }
            else {
                sumRight = 0
            }
            
        }
        
        return -1
    }
}

let sol : Solution = Solution()
print(sol.pivotIndex([-1,-1,-1,0,1,1]))
