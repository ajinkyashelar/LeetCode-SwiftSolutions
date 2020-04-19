import UIKit

//Search in Rotated Sorted Array
//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var hi : Int = nums.count-1
        var lo : Int = 0
        
        while lo <= hi {
            
            let mid = (hi + lo)/2
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] >= nums[lo] {
                //Bottom half is NOT rotated...
                if target >= nums[lo] && target < nums[mid] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else {
                //Bottom half IS rotated...
                if target > nums[mid] && target <= nums[hi] {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.search([5,1,3], 5))
