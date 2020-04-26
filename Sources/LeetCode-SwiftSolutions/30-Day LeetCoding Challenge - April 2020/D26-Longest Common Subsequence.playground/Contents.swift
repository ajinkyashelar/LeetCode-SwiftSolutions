import UIKit

//Longest Common Subsequence
//Solution
//Given two strings text1 and text2, return the length of their longest common subsequence.
//
//A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
//
//
//
//If there is no common subsequence, return 0.
//
//
//
//Example 1:
//
//Input: text1 = "abcde", text2 = "ace"
//Output: 3
//Explanation: The longest common subsequence is "ace" and its length is 3.
//Example 2:
//
//Input: text1 = "abc", text2 = "abc"
//Output: 3
//Explanation: The longest common subsequence is "abc" and its length is 3.
//Example 3:
//
//Input: text1 = "abc", text2 = "def"
//Output: 0
//Explanation: There is no such common subsequence, so the result is 0.
//
//
//Constraints:
//
//1 <= text1.length <= 1000
//1 <= text2.length <= 1000
//The input strings consist of lowercase English characters only.
//
//  Hide Hint #1
//Try dynamic programming. DP[i][j] represents the longest common subsequence of text1[0 ... i] & text2[0 ... j].
//   Hide Hint #2
//DP[i][j] = DP[i - 1][j - 1] + 1 , if text1[i] == text2[j] DP[i][j] = max(DP[i - 1][j], DP[i][j - 1]) , otherwise

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.count == 0 || text2.count == 0 { return 0 }
        var result = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        let string1 = Array(text1)
        let string2 = Array(text2)
        
        for i in 1 ... string1.count {
            for j in 1 ... string2.count {
                if string1[i - 1] == string2[j - 1] {
                    result[i][j] = 1 + result[i-1][j-1]
                } else {
                    result[i][j] = max(result[i-1][j], result[i][j-1])
                }
            }
        }
        
        return result[string1.count][string2.count]
    }
}

let sl = Solution()
print(sl.longestCommonSubsequence("ace", "abcde"))
