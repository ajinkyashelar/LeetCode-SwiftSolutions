import UIKit

//Jewels and Stones
//You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
//
//The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
//
//Example 1:
//
//Input: J = "aA", S = "aAAbbbb"
//Output: 3
//Example 2:
//
//Input: J = "z", S = "ZZ"
//Output: 0
//Note:
//
//S and J will consist of letters and have length at most 50.
//The characters in J are distinct.
//   Hide Hint #1
//For each stone, check if it is a jewel.

class Solution {
    //Runtime: 8 ms
    //Memory Usage: 20.8 MB
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jewels: [String] = J.map{String($0)}
        let stones: [String] = S.map{String($0)}
        var jewelSet: Set<String> = []
        var count = 0
        for jewel in jewels {
            jewelSet.insert(jewel)
        }
        
        for stone in stones {
            if jewelSet.contains(stone){
                count += 1
            }
        }
        return count
    }
    
    func numJewelsInStonesShort(_ J: String, _ S: String) -> Int {
        let jewelSet: Set<Character> = Set<Character>(J.map{$0})
        var count = 0
        for stone in S {
            if jewelSet.contains(stone){
                count += 1
            }
        }
        return count
    }
}

let sl = Solution()
print(sl.numJewelsInStones("aA", "aAAbbbb"))
