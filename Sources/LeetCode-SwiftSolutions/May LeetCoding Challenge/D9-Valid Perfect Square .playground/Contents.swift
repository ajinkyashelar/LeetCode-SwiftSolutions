import UIKit

//Valid Perfect Square
//Solution
//Given a positive integer num, write a function which returns True if num is a perfect square else False.
//
//Note: Do not use any built-in library function such as sqrt.
//
//Example 1:
//
//Input: 16
//Output: true
//Example 2:
//
//Input: 14
//Output: false


class Solution {
    func isPerfectSquare4ms(_ num: Int) -> Bool {
        var i = 1
        while i * i <= num {
            if i * i == num {
                return true
            }
            i += 1
        }
        return false
    }
    
    func isPerfectSquare(_ num: Int) -> Bool {
        
        func isPerfectSquareCheck(start: Int, end: Int, mid: Int) -> Bool {
            if mid * mid == num {
                return true
            }
            
            if start >= end {
                return false
            }
            print(mid)
            if mid * mid > num {
                return isPerfectSquareCheck(start: start, end: mid, mid: (start+mid)/2)
            }
            else {
                return isPerfectSquareCheck(start: mid+1, end: end, mid: (mid+1+end)/2)
            }
            
        }
        if num <= 1 {
            return true
        }
        return isPerfectSquareCheck(start: 0, end: num, mid: num/2)
    }
}

let sl = Solution()
print(sl.isPerfectSquare(14))
