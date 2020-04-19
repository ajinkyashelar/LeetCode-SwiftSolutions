import UIKit

//1. Two Sum
//
//Easy
//
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict : [Int : Int] = [:] // Dict to store each index & element
        for index in 0..<nums.count {
            let value = nums[index]
            let remainder = target - value
            if let anotherIndex = dict[remainder] {// Find the remainder pair
                return [index, anotherIndex]
            }
            dict[value] = index
        }
        return [-1, -1]
    }
}

let sol = Solution()
print(sol.twoSum([2, 7, 11, 15], 9))
