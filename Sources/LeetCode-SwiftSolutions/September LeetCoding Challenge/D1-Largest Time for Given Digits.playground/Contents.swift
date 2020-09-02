import UIKit

//Largest Time for Given Digits
//Given an array of 4 digits, return the largest 24 hour time that can be made.
//
//The smallest 24 hour time is 00:00, and the largest is 23:59.  Starting from 00:00, a time is larger if more time has elapsed since midnight.
//
//Return the answer as a string of length 5.  If no valid time can be made, return an empty string.
//
//
//
//Example 1:
//
//Input: [1,2,3,4]
//Output: "23:41"
//Example 2:
//
//Input: [5,5,5,5]
//Output: ""
//
//
//Note:
//
//A.length == 4
//0 <= A[i] <= 9

class Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        var permutations: [(h:Int, m: Int)] = []
        for i in 0...3 {
            let d1 = A[i]
            for j in 0...3 {
                if j == i { continue }
                let d2 = A[j]
                for k in 0...3 {
                    if k == j || k == i  { continue }
                    let d3 = A[k]
                    for l in 0...3 {
                        if l == j || l == i || l == k  { continue }
                        let d4 = A[l]
                        if d1*10 + d2 < 24 && d3*10 + d4 < 60 {
                            permutations.append((h: d1*10 + d2, m: d3*10 + d4))
                        }
                    }
                }
            }
        }
        if permutations.count == 0 { return "" }
        var maxVal = (h: 0, m: 0)
        for val in permutations {
            if val.h*60 + val.m > maxVal.h*60 + maxVal.m {
                maxVal = val
            }
        }
        
        return "\(String(format: "%02d", maxVal.h)):\(String(format: "%02d", maxVal.m))"
    }
}

let sol : Solution = Solution()
print(sol.largestTimeFromDigits([2,0,6,6]))
