import UIKit

var str = "Hello, playground"

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        if nums.count == 1
        {
            return nums[0]
        }
        
        for (i, element) in nums.enumerated() {
            var sum = element
            if sum > result {
                result = sum
                print("Result = \(result)")
            }
            print("index: \(sum)")
            for nextIndex in i+1..<nums.count  {
                print("nextIndex :  \(nums[nextIndex])")
                sum = sum + nums[nextIndex]
                print("sum: \(sum)")
                if sum > result {
                    result = sum
                    print("Result = \(result)")
                }
            }
        }

        return result
        
    }
    
    func maxSubArrayDP(_ nums: [Int]) -> Int {
        var m = 0
        var result = Int.min
        for i in 0..<nums.count {
            m = max(nums[i], nums[i] + m)
            result = max(result, m)
        }
        
        return result
    }
}

var sol : Solution = Solution()
print(sol.maxSubArray([-2, 1]))
//print(sol.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
