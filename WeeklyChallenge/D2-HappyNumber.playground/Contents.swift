import UIKit

//Write an algorithm to determine if a number is "happy".
//
//A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
//
//Example:
//
//Input: 19
//Output: true
//Explanation:
//12 + 92 = 82
//82 + 22 = 68
//62 + 82 = 100
//12 + 02 + 02 = 1

class Solution {
    
    var sumSet : Set<Int> = [] //Memoization to store values in Set
    
    func isHappy(_ n: Int) -> Bool {
        
        if sumSet.contains(n) { // If number starts repeating break the recursion
            return false
        }

        if n == 1 {
            return true  // If Happy
        }
        else {
            
            let arrayOfNum : [Int] = "\(n)".compactMap {
                $0.wholeNumberValue
            }
            var sum = 0
            for num in arrayOfNum {
                sum = (num * num) + sum
            }
            print(n)
            sumSet.insert(n)
        
            return sum == 1 ? true : isHappy(sum)
            
        }
    }
}

var sol : Solution = Solution()
print((sol.isHappy( 2)))
