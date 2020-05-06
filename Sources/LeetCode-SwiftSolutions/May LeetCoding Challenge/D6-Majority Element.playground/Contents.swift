import UIKit

//Majority Element
//Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//
//You may assume that the array is non-empty and the majority element always exist in the array.
//
//Example 1:
//
//Input: [3,2,3]
//Output: 3
//Example 2:
//
//Input: [2,2,1,1,1,2,2]
//Output: 2


class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict : [Int:Int] = [:]
        for i in 0..<nums.count {
            dict[nums[i]] = dict[nums[i]] != nil ? dict[nums[i]]! + 1 : 1
            if dict[nums[i]]! > nums.count/2 {
                return nums[i]
            }
        }
        return -1
    }
}
