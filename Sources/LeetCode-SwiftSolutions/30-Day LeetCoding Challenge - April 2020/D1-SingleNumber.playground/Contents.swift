import UIKit

//Single Number
//Solution
//Given a non-empty array of integers, every element appears twice except for one. Find that single one.
//
//Note:
//
//Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//
//Example 1:
//
//Input: [2,2,1]
//Output: 1
//Example 2:
//
//Input: [4,1,2,1,2]
//Output: 4

var str = "Hello, playground"
class Solution {
    func singleNumber(_ numsArray: [Int]) -> Int {
        var nums : [Int] = numsArray
        for i in 0..<nums.count {
            var hasDuplicate : Bool = false;
            for j in i+1..<nums.count{
                if nums[i] == nums[j] {
                    print("\(i), \(j), \(nums[i]), \(nums[j])")
                    hasDuplicate = true
                    nums.remove(at: j)
                    break
                }
                else{
                    
                    print("a \(i), \(j), \(nums[i]), \(nums[j])")
                }
            }
            
            if hasDuplicate == false {
                return nums[i]
            }
        }
        
        return  -1
    }
    
    func singleNumberXOR(_ nums: [Int]) -> Int {
        var result : Int = 0
        for i in nums {
            print("\(result)^=\(i)")
            result ^= i
            print("\(result)")
        }
        return  result
    }
}


let sol : Solution = Solution()
print("\(sol.singleNumber([2,2,1]))")
print("\(sol.singleNumberXOR([2,2,1]))")
