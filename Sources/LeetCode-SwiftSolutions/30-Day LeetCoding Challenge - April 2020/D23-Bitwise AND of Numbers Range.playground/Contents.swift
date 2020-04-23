import UIKit

//Bitwise AND of Numbers Range
//Solution
//Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.
//
//Example 1:
//
//Input: [5,7]
//Output: 4
//Example 2:
//
//Input: [0,1]
//Output: 0

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == 0 {
            return 0
        }
        
        var result : Int = 0
        var n = n
        
        while m != n {
            m >>= 1
            print("m >>= 1", m)
            n >>= 1
            print("n >>= 1", n)
            result  += 1
            print("result", result)
        }
    
        print("m<<result", m<<result)
        return m<<result
    }
}

let sol = Solution()
print(sol.rangeBitwiseAnd(5, 7))
