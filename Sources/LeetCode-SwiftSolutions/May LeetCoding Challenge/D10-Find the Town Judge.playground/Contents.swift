import UIKit

//Find the Town Judge
//In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.
//
//If the town judge exists, then:
//
//The town judge trusts nobody.
//Everybody (except for the town judge) trusts the town judge.
//There is exactly one person that satisfies properties 1 and 2.
//You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.
//
//If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.
//
//
//
//Example 1:
//
//Input: N = 2, trust = [[1,2]]
//Output: 2
//Example 2:
//
//Input: N = 3, trust = [[1,3],[2,3]]
//Output: 3
//Example 3:
//
//Input: N = 3, trust = [[1,3],[2,3],[3,1]]
//Output: -1
//Example 4:
//
//Input: N = 3, trust = [[1,2],[2,3]]
//Output: -1
//Example 5:
//
//Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
//Output: 3
//
//
//Note:
//
//1 <= N <= 1000
//trust.length <= 10000
//trust[i] are all different
//trust[i][0] != trust[i][1]
//1 <= trust[i][0], trust[i][1] <= N

class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var setPerson: Set<Int> = []
        if N == 1 {
            return N
        }
        
        if trust.count <= 0 {
            return -1
        }
        
        for i in 1..<N+1 { // Add all person to a set
            setPerson.insert(i)
        }
        
        for person in trust {
            setPerson.remove(person[0]) // Remove person who trust someone else as they cannot be judge
        }
        
        if setPerson.count > 0 {
            var count = 0
            let num = setPerson.first!
            for person in trust {
                if person[1] == num {
                    count += 1 // Get the count of person trusting the judge
                }
            }
            if count == N - 1{ // Check if all the other people trust the judge.
                return num
            }
            else {
                return -1
            }
        }
        else {
            return -1
        }
    }
}
