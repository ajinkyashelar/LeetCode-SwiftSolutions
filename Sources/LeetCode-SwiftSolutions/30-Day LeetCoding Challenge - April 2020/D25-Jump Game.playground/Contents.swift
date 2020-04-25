import UIKit

//Jump Game
//Solution
//Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Determine if you are able to reach the last index.
//
//Example 1:
//
//Input: [2,3,1,1,4]
//Output: true
//Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Example 2:
//
//Input: [3,2,1,0,4]
//Output: false
//Explanation: You will always arrive at index 3 no matter what. Its maximum
//             jump length is 0, which makes it impossible to reach the last index.

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else {
            return true
        }
        var maxReach: Int = 0
        for i in 0..<nums.count-1 {
            if maxReach < i + nums[i]  {
                   maxReach = i + nums[i]
            }
            if maxReach == i && nums[i] == 0 {
                return false
            }
        }
        return true
    }
}

let sl = Solution()
print(sl.canJump([1,2,3]))
