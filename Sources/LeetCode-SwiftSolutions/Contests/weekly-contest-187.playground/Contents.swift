import UIKit

class Solution {
    //Accepted - Destination City
    func destCity(_ paths: [[String]]) -> String {
        var setDestination: Set<String> = []
        
        for i in 0..<paths.count {
            setDestination.insert(paths[i][1])
            
            if setDestination.contains(paths[i][0]) {
                setDestination.remove(paths[i][0])
            }

        }
                
        return setDestination[setDestination.startIndex]
    }
    
    //Accepted -Check If All 1's Are at Least Length K Places Away
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
            var prevCount = 0
            for i in 0..<nums.count {
                if nums[i] == 1 && i != 0 {
                    if prevCount < k {
                        return false
                    }
                    prevCount = 0
                }
                else {
                    prevCount += 1
                }
            }
            
            return true
    }

    //Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var maxCount: Int = 0
        for i in 0..<nums.count {
            var subArray = [nums[i]]
            for j in i+1..<nums.count {
                subArray.append(nums[j])
                if maximumAbsoluteDiff(subArray) <= limit {
                    maxCount = max(maxCount, subArray.count)
                }
            }
        }
        return maxCount
    }
    
    func maximumAbsoluteDiff(_ subArray:[Int])->Int{
        let max = subArray.max()!
        let min = subArray.min()!
        return abs(max-min)
    }
    
    // Find the Kth Smallest Sum of a Matrix With Sorted Rows
    func kthSmallest(_ mat: [[Int]], _ k: Int) -> Int {
        var arrSum : [Int] = []
        let m = mat.count
        let n = mat[0].count
        
        for i in 0..<m {//row
            for j in 0..<m {
                var sum = 0
                for k in 0..<n {
                    print(j,k)
                   sum = sum + mat[j][k]
                }
                arrSum.append(sum)
            }
        }
        
        return arrSum[k]
    }
}
