import UIKit

//Subarray Sum Equals K
//Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
//
//Example 1:
//Input:nums = [1,1,1], k = 2
//Output: 2
//Note:
//The length of the array is in range [1, 20,000].
//The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
//   Hide Hint #1
//Will Brute force work here? Try to optimize it.
//   Hide Hint #2
//Can we optimize it by using some extra space?
//   Hide Hint #3
//What about storing sum frequencies in a hash table? Will it be useful?
//   Hide Hint #4
//sum(i,j)=sum(0,j)-sum(0,i), where sum(i,j) represents the sum of all the elements from index i to j-1. Can we use this property to optimize it.

class Solution {
    func subarraySumBruteForce(_ nums: [Int], _ k: Int) -> Int {
        var count : Int = 0
        var sum : Int = 0
        for i in 0..<nums.count {
            print("i", i)
            sum = nums[i]
            print("sum=",sum)
            print(i)
            if sum == k {
                print("sum=k i", i)
                count += 1
                print("count", count)
             }
            
            for j in i+1..<nums.count {
                print("i", i,"j", j)
                sum = sum + nums[j]
                print("sum=",sum)
                if sum == k {
                    print("sum=k i", i,"j", j)
                    count += 1
                    print("count", count)
                }
            }
            
        }
        return count
    }
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count : Int = 0
        var sum : Int = 0
        var hashMap : [Int:Int] = [0:1]
        
        for i in 0..<nums.count {
            sum += nums[i]
            if (hashMap[sum-k] != nil) {
                count += hashMap[sum-k] ?? 0
            }
            
            if let val = hashMap[sum] {
                hashMap[sum] = val + 1
            } else {
                hashMap[sum] = 1
            }
        }
        return count
    }
}

let sol = Solution()
print(sol.subarraySum([100,1,2,3,100,1,2,3,4],3))
