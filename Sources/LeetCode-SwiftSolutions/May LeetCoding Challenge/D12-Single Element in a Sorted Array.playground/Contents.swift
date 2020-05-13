import UIKit

//Single Element in a Sorted Array
//Solution
//You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.
//
//
//
//Example 1:
//
//Input: [1,1,2,3,3,4,4,8,8]
//Output: 2
//Example 2:
//
//Input: [3,3,7,7,10,11,11]
//Output: 10
//
//
//Note: Your solution should run in O(log n) time and O(1) space.

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var stack : [Int] = []
        if nums.count != 0 {
            stack.append(nums[0])
        }
        for i in 1..<nums.count {
            if nums[i] == stack.last {
                stack.removeLast()
            }
            else {
                stack.append(nums[i])
            }
        }
        return stack[0]
    }
    
    func singleNonDuplicateBetter(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        for i in 1..<nums.count-1 {
            if nums[i] != nums[i-1] && nums[i] != nums[i+1]  {
                return nums[i]
            }
        }
        return nums[0]
    }
    
    func singleNonDuplicateXOR(_ nums: [Int]) -> Int {
        
        var result = nums[0]
        for i in 1..<nums.count {
            result ^= nums[i]
        }
        
        return result
    }
}
