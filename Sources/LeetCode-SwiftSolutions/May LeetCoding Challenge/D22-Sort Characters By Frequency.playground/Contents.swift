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
    func frequencySortSubmit(_ s: String) -> String {
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
    
    // 96ms, 90,91%, O(Nlog(N)), ???
    func frequencySort0(_ s: String) -> String {
        return s.reduce(into: [:]) {
            $0[$1, default: 0] += 1
        }.sorted {
            $0.value > $1.value
        }.reduce("") {
            $0 + String(repeating: $1.key, count: $1.value)
        }
    }
    
    // 140ms, 33.33%, O(N)
    func frequencySort(_ s: String) -> String {
        var dict = [Character: Int](), maxValue = 0
        for c in s {
            dict[c, default: 0] += 1
            maxValue = max(maxValue, dict[c]!)
        }
        var buckets = Array(repeating: [Character](), count: maxValue+1)
        for (k, v) in dict {
            buckets[v].append(k)
        }
        var i = buckets.count-1, ans = ""
        while i > 0 {
            buckets[i].forEach { ans += String(repeating: $0, count: i) }
            i -= 1
        }
        return ans
    }
    
    // 436ms
    func frequencySort1(_ s: String) -> String {
        var buckets = Array(repeating: [Character](), count: s.count+1)
        for (k, v) in s.reduce(into: [:], { $0[$1, default: 0] += 1 }) {
            buckets[v].append(k)
        }
        return buckets.enumerated().reversed().reduce("") { v, e in
            v + e.element.reduce("") { $0 + String(repeating: $1, count: e.offset) }
        }
    }
}
