import UIKit

//Ransom Note
//Solution
//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//Each letter in the magazine string can only be used once in your ransom note.
//
//Note:
//You may assume that both strings contain only lowercase letters.
//
//canConstruct("a", "b") -> false
//canConstruct("aa", "ab") -> false
//canConstruct("aa", "aab") -> true

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var magDict : [Character:Int] = [:]
        for char in magazine {
            if let value = magDict[char] {
                magDict[char] = value + 1
            }
            else {
                magDict[char] = 1
            }
        }
        for char in ransomNote {
            if let value = magDict[char], value > 0 {
                magDict[char] = value - 1
            }
            else {
                return false
            }
        }
        return true
    }
}

let sl = Solution()
print(sl.canConstruct("aa", "aab"))
