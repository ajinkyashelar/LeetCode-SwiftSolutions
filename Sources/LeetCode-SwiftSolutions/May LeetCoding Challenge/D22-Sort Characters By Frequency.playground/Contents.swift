import UIKit

//Sort Characters By Frequency
//Solution
//Given a string, sort it in decreasing order based on the frequency of characters.
//
//Example 1:
//
//Input:
//"tree"
//
//Output:
//"eert"
//
//Explanation:
//'e' appears twice while 'r' and 't' both appear once.
//So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
//Example 2:
//
//Input:
//"cccaaa"
//
//Output:
//"cccaaa"
//
//Explanation:
//Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
//Note that "cacaca" is incorrect, as the same characters must be together.
//Example 3:
//
//Input:
//"Aabb"
//
//Output:
//"bbAa"
//
//Explanation:
//"bbaA" is also a valid answer, but "Aabb" is incorrect.
//Note that 'A' and 'a' are treated as two different characters.

class Solution {
    func frequencySort(_ s: String) -> String {
    var dic = [Character : Int]()
    for i in s {
        dic[i]  = dic[i] != nil ?  dic[i]! + 1 : 1
        
    }
    let par = dic.sorted { $0.1 > $1.1 }
    var output = ""
    for i in par {
        for _ in 1 ... i.value {
            output.append(i.key)
        }
    }
    return output
}
}
