import UIKit

//Minimum Value to Get Positive Step by Step Sum
//User Accepted:21
//User Tried:27
//Total Accepted:21
//Total Submissions:28
//Difficulty:Easy
//Given an array of integers nums, you start with an initial positive value startValue.
//
//In each iteration, you calculate the step by step sum of startValue plus elements in nums (from left to right).
//
//Return the minimum positive value of startValue such that the step by step sum is never less than 1.
//
//
//
//Example 1:
//
//Input: nums = [-3,2,-3,4,2]
//Output: 5
//Explanation: If you choose startValue = 4, in the third iteration your step by step sum is less than 1.
//                step by step sum
//                startValue = 4 | startValue = 5 | nums
//                  (4 -3 ) = 1  | (5 -3 ) = 2    |  -3
//                  (1 +2 ) = 3  | (2 +2 ) = 4    |   2
//                  (3 -3 ) = 0  | (4 -3 ) = 1    |  -3
//                  (0 +4 ) = 4  | (1 +4 ) = 5    |   4
//                  (4 +2 ) = 6  | (5 +2 ) = 7    |   2
//Example 2:
//
//Input: nums = [1,2]
//Output: 1
//Explanation: Minimum start value should be positive.
//Example 3:
//
//Input: nums = [1,-2,-3]
//Output: 5
//
//
//Constraints:
//
//1 <= nums.length <= 100
//-100 <= nums[i] <= 100


//5373. Find the Minimum Number of Fibonacci Numbers Whose Sum Is K
//User Accepted:247
//User Tried:283
//Total Accepted:247
//Total Submissions:302
//Difficulty:Medium
//Given the number k, return the minimum number of Fibonacci numbers whose sum is equal to k, whether a Fibonacci number could be used multiple times.
//
//The Fibonacci numbers are defined as:
//
//F1 = 1
//F2 = 1
//Fn = Fn-1 + Fn-2 , for n > 2.
//It is guaranteed that for the given constraints we can always find such fibonacci numbers that sum k.
//
//
//Example 1:
//
//Input: k = 7
//Output: 2
//Explanation: The Fibonacci numbers are: 1, 1, 2, 3, 5, 8, 13, ...
//For k = 7 we can use 2 + 5 = 7.
//Example 2:
//
//Input: k = 10
//Output: 2
//Explanation: For k = 10 we can use 2 + 8 = 10.
//Example 3:
//
//Input: k = 19
//Output: 3
//Explanation: For k = 19 we can use 1 + 5 + 13 = 19.
//
//
//Constraints:
//
//1 <= k <= 10^9

//5374. The k-th Lexicographical String of All Happy Strings of Length n
//User Accepted:1000
//User Tried:1060
//Total Accepted:1008
//Total Submissions:1261
//Difficulty:Medium
//A happy string is a string that:
//
//consists only of letters of the set ['a', 'b', 'c'].
//s[i] != s[i + 1] for all values of i from 1 to s.length - 1 (string is 1-indexed).
//For example, strings "abc", "ac", "b" and "abcbabcbcb" are all happy strings and strings "aa", "baa" and "ababbc" are not happy strings.
//
//Given two integers n and k, consider a list of all happy strings of length n sorted in lexicographical order.
//
//Return the kth string of this list or return an empty string if there are less than k happy strings of length n.
//
//
//
//Example 1:
//
//Input: n = 1, k = 3
//Output: "c"
//Explanation: The list ["a", "b", "c"] contains all happy strings of length 1. The third string is "c".
//Example 2:
//
//Input: n = 1, k = 4
//Output: ""
//Explanation: There are only 3 happy strings of length 1.
//Example 3:
//
//Input: n = 3, k = 9
//Output: "cab"
//Explanation: There are 12 different happy string of length 3 ["aba", "abc", "aca", "acb", "bab", "bac", "bca", "bcb", "cab", "cac", "cba", "cbc"]. You will find the 9th string = "cab"
//Example 4:
//
//Input: n = 2, k = 7
//Output: ""
//Example 5:
//
//Input: n = 10, k = 100
//Output: "abacbabacb"
//
//
//Constraints:
//
//1 <= n <= 10
//1 <= k <= 100

//5375. Restore The Array
//User Accepted:17
//User Tried:28
//Total Accepted:17
//Total Submissions:39
//Difficulty:Hard
//A program was supposed to print an array of integers. The program forgot to print whitespaces and the array is printed as a string of digits and all we know is that all integers in the array were in the range [1, k] and there are no leading zeros in the array.
//
//Given the string s and the integer k. There can be multiple ways to restore the array.
//
//Return the number of possible array that can be printed as a string s using the mentioned program.
//
//The number of ways could be very large so return it modulo 10^9 + 7
//
//
//
//Example 1:
//
//Input: s = "1000", k = 10000
//Output: 1
//Explanation: The only possible array is [1000]
//Example 2:
//
//Input: s = "1000", k = 10
//Output: 0
//Explanation: There cannot be an array that was printed this way and has all integer >= 1 and <= 10.
//Example 3:
//
//Input: s = "1317", k = 2000
//Output: 8
//Explanation: Possible arrays are [1317],[131,7],[13,17],[1,317],[13,1,7],[1,31,7],[1,3,17],[1,3,1,7]
//Example 4:
//
//Input: s = "2020", k = 30
//Output: 1
//Explanation: The only possible array is [20,20]. [2020] is invalid because 2020 > 30. [2,020] is ivalid because 020 contains leading zeros.
//Example 5:
//
//Input: s = "1234567890", k = 90
//Output: 34
//
//
//Constraints:
//
//1 <= s.length <= 10^5.
//s consists of only digits and doesn't contain leading zeros.
//1 <= k <= 10^9.


class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        var min : Int = 0
        var sum : Int = 0
        for i in nums {
            sum = i + sum
            if sum < min {
                min = sum
            }
        }
        
        return -(min) + 1
    }
    
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        var fibinacciNum : [Int] = []
        var result = 1
        for i in 0..<k+1 {
            if  i < 2 {
                result += result
                fibinacciNum.append(1)
            }
            else {
                result = fibinacciNum[i-1] + fibinacciNum[i-2]
                if result > k {
                    break
                }
                fibinacciNum.append(result)
            }
        }
        
        var sum = 0
        var sumArray : [Int] = []
        for j in fibinacciNum.reversed() {
            
            sum = j + sum
            if sum < k {
                sumArray.append(j)
            }
            else if sum > k {
                sum = sum - j
            }
            else {
                sumArray.append(j)
            }
        }
        print(fibinacciNum)
        return sumArray.count
    }
    
    func getHappyString(_ n: Int, _ k: Int) -> String {
        var stringArray : [String] = []
        let charArray : [String] = ["a", "b", "c"]
        for (index, char) in charArray.enumerated() {
            var subArray = charArray
            subArray.remove(at: index)
            print(subArray)
            for (ind,sub) in subArray.enumerated() {
                var str = char
                print(str)
                str += sub
                for j in str.count..<n {
                  str += subArray[j-1]
                  print(str)
                }
                stringArray.append(str)
                print(stringArray)
            }
        }
        print(stringArray)
        stringArray = stringArray.sorted()
        
        return k < stringArray.count ? stringArray[k] : ""
    }
    
//    func numberOfArrays(_ s: String, _ k: Int) -> Int {
//
//    }
    
}

let sol = Solution()
//print(sol.minStartValue([-3,2,-3,4,2]))
//print(sol.findMinFibonacciNumbers(3))
print(sol.getHappyString(3, 3))
