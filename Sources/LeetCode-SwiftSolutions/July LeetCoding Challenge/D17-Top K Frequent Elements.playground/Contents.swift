import UIKit

//Top K Frequent Elements
//
//Given a non-empty array of integers, return the k most frequent elements.
//
//Example 1:
//
//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]
//Example 2:
//
//Input: nums = [1], k = 1
//Output: [1]
//Note:
//
//You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
//Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
//It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
//You can return the answer in any order.

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var dict : [Int:Int] = [:]
        var arr : [Int] = []
        for num in nums {
            if let count = dict[num] {
                dict[num] = count + 1
            }
            else {
                dict[num] = 1
            }
        }
        
        let sortedDict = dict.sorted { $0.value > $1.value}

        var count = 0
        print(sortedDict)
        for (key,_) in sortedDict {
            if count >= k {
                break
            }
            count += 1
            arr.append(key)
        }

        return arr
    }
}

let sl = Solution()
print(sl.topKFrequent([1,1,1,2,2,3], 2))
