import UIKit
//Plus One
//Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
//
//The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
//
//You may assume the integer does not contain any leading zero, except the number 0 itself.
//
//Example 1:
//
//Input: [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.
//Example 2:
//
//Input: [4,3,2,1]
//Output: [4,3,2,2]
//Explanation: The array represents the integer 4321.

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var nums = digits
        var carry = 1
        for i in (0..<nums.count).reversed() {
            if nums[i] > 8 && carry == 1 {
               nums[i] =  0
               carry = 1
            }
            else {
                nums[i] =  nums[i] + carry
                carry = 0
            }
            if i == 0 && carry == 1 {
                nums.insert(carry, at: i)
            }
        }
        return nums
    }
}

let sol : Solution = Solution()
print(sol.plusOne([9,8,7,6,5,4,3,2,1,1]))
//[9,8,7,6,5,4,3,2,1,1]
