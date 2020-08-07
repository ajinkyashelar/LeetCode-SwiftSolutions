import UIKit

//Valid Palindrome
//Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
//
//Note: For the purpose of this problem, we define empty string as valid palindrome.
//
//Example 1:
//
//Input: "A man, a plan, a canal: Panama"
//Output: true
//Example 2:
//
//Input: "race a car"
//Output: false
//
//
//Constraints:
//
//s consists only of printable ASCII characters.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let result = s.replacingOccurrences(of: "[^a-zA-Z0-9]+", with: "", options: [.regularExpression])
        let array : [String] = result.map({ String($0).lowercased() })
        for i in 0..<array.count/2 {
            if array[i] != array[array.count-i-1] {
                return false
            }
        }
        return true
    }
}

let sol = Solution()
sol.isPalindrome("A man, a plan, a canal: Panama")
sol.isPalindrome("race a car")
