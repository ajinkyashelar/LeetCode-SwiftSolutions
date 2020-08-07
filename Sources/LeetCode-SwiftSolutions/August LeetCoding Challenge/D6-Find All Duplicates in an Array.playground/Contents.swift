import UIKit

//Find All Duplicates in an Array
//Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
//
//Find all the elements that appear twice in this array.
//
//Could you do it without extra space and in O(n) runtime?
//
//Example:
//Input:
//[4,3,2,7,8,2,3,1]
//
//Output:
//[2,3]

class Solution {
    func findDuplicatesBruteForce(_ nums: [Int]) -> [Int] {
        var result : [Int] = []
        var numDict : [Int:Int] =  [:]
        
        for num in nums {
            numDict[num, default: 0] += 1
        }
        
        for (key, value) in numDict {
            if value == 2 {
                result.append(key)
            }
        }
        return result
    }
    
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var result : [Int] = []
        var numArray =  nums
        for (_, num) in numArray.enumerated() {
            let hashIndex = abs(num - 1)
            print("num \(num)")
            print("hashIndex \(hashIndex)")
            if numArray[hashIndex] > 0 {
                print("-> ")
                print(numArray[hashIndex])
                numArray[hashIndex] *= -1
                print(numArray)
            }
            else {// Duplicate found
                print("-> Duplicate ")
                print(numArray[hashIndex])
                print("append \(num)")
                result.append(num)
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.findDuplicates([4,3,2,7,8,2,3,1]))
