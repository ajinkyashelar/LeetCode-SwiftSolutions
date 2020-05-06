import UIKit

//First Unique Character in a String
//Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.
//Note: You may assume the string contain only lowercase letters.


class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let sArr: [Character] = s.map({$0})
        var dict: [Character:Int] = [:]
        for char in sArr {
            dict[char] = dict[char] != nil ? dict[char]! + 1 : 1
        }
        
        for (index, char) in sArr.enumerated() {
            if dict[char] == 1 {
                return index
            }
        }
        return -1
    }
    
    func firstUniqCharFailed(_ s: String) -> Int {
        let sArr: [Character] = s.map({$0})
        var setNonUnique: Set<Character> = []
        for (index, char) in sArr.enumerated() {
            var isUnique = true
            for nextIndex in index+1..<sArr.count {
                if char == sArr[nextIndex] {
                    isUnique = false
                    setNonUnique.insert(char)
                }
            }
            if isUnique == true && !setNonUnique.contains(char) {
                return index
            }
        }
        return -1
    }
}

let sl = Solution()
print(sl.firstUniqChar("loeleeoe"))


