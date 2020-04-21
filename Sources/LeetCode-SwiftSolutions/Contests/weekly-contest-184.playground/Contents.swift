import UIKit




class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var substring : Set<String> = []
        for word in words {
            for checkword in words {
                if word != checkword && checkword.contains(word) {
                    substring.insert(word)
                }
            }
        }
        
        return Array(substring)
    }
    
    func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
        var arrayP : [Int] = []
        var result : [Int] = []
        for i in 1..<m+1 {
            arrayP.append(i)
        }
        for num in queries {
            for (index, checkNum) in arrayP.enumerated() {
                if checkNum == num {
                    result.append(index)
                    arrayP.remove(at: index)
                    arrayP.insert(checkNum, at: 0)
                    break
                }
            }
        }
        
        return result
    }
    
    var setCheck : Set<String> = ["&quot;", "&apos;", "&amp;", "&gt;", "&lt;", "&frasl;"]
         
    var dictGet : [String:String] = ["&quot;":"\"", "&apos;": "'", "&amp;": "&", "&gt;": ">", "&lt;": "<", "&frasl;" : "/"]
    
    func entityParser(_ text: String) -> String {
       var textCompare : String = text
        for compare in setCheck {
            if textCompare.contains(compare) {
               textCompare = textCompare.replacingOccurrences(of: compare, with: dictGet[compare] ?? "")
            }
        }
        return textCompare
    }
    
    func numOfWays(_ n: Int) -> Int {
        var sum : Int = 0
        for i in 1..<4 {
            sum = sum + ((3/i) * Int(factorial(Double(i))))
        }
        return sum
    }
    
    public func factorial(_ N: Double) -> Double {
        var mult = N
        var retVal: Double = 1.0
        while mult > 0.0 {
            retVal *= mult
            mult -= 1.0
        }
        print(N, retVal)
        return retVal
    }
}

let sol : Solution = Solution()
print(sol.stringMatching(["mass","as","hero","superhero"]))
print(sol.processQueries([3,1,2,1], 5))
print(sol.entityParser("and I quote: &quot;...&quot;"))
print(sol.numOfWays(2))

//5380. String Matching in an Array
//
//Difficulty:Easy
//Given an array of string words. Return all strings in words which is substring of another word in any order.
//
//String words[i] is substring of words[j], if can be obtained removing some characters to left and/or right side of words[j].
//
//
//
//Example 1:
//
//Input: words = ["mass","as","hero","superhero"]
//Output: ["as","hero"]
//Explanation: "as" is substring of "mass" and "hero" is substring of "superhero".
//["hero","as"] is also a valid answer.
//Example 2:
//
//Input: words = ["leetcode","et","code"]
//Output: ["et","code"]
//Explanation: "et", "code" are substring of "leetcode".
//Example 3:
//
//Input: words = ["blue","green","bu"]
//Output: []
//
//
//Constraints:
//
//1 <= words.length <= 100
//1 <= words[i].length <= 30
//words[i] contains only lowercase English letters.
//It's guaranteed that words[i] will be unique.

//5381. Queries on a Permutation With Key
//User Accepted:1344
//User Tried:1398
//Total Accepted:1352
//Total Submissions:1461
//Difficulty:Medium
//Given the array queries of positive integers between 1 and m, you have to process all queries[i] (from i=0 to i=queries.length-1) according to the following rules:
//
//In the beginning, you have the permutation P=[1,2,3,...,m].
//For the current i, find the position of queries[i] in the permutation P (indexing from 0) and then move this at the beginning of the permutation P. Notice that the position of queries[i] in P is the result for queries[i].
//Return an array containing the result for the given queries.
//
//
//
//Example 1:
//
//Input: queries = [3,1,2,1], m = 5
//Output: [2,1,2,1]
//Explanation: The queries are processed as follow:
//For i=0: queries[i]=3, P=[1,2,3,4,5], position of 3 in P is 2, then we move 3 to the beginning of P resulting in P=[3,1,2,4,5].
//For i=1: queries[i]=1, P=[3,1,2,4,5], position of 1 in P is 1, then we move 1 to the beginning of P resulting in P=[1,3,2,4,5].
//For i=2: queries[i]=2, P=[1,3,2,4,5], position of 2 in P is 2, then we move 2 to the beginning of P resulting in P=[2,1,3,4,5].
//For i=3: queries[i]=1, P=[2,1,3,4,5], position of 1 in P is 1, then we move 1 to the beginning of P resulting in P=[1,2,3,4,5].
//Therefore, the array containing the result is [2,1,2,1].
//Example 2:
//
//Input: queries = [4,1,2,2], m = 4
//Output: [3,1,2,0]
//Example 3:
//
//Input: queries = [7,5,5,8,3], m = 8
//Output: [6,5,0,7,5]
//
//
//Constraints:
//
//1 <= m <= 10^3
//1 <= queries.length <= m
//1 <= queries[i] <= m

//
//5382. HTML Entity Parser
//User Accepted:0
//User Tried:0
//Total Accepted:0
//Total Submissions:0
//Difficulty:Medium
//HTML entity parser is the parser that takes HTML code as input and replace all the entities of the special characters by the characters itself.
//
//The special characters and their entities for HTML are:
//
//Quotation Mark: the entity is &quot; and symbol character is ".
//Single Quote Mark: the entity is &apos; and symbol character is '.
//Ampersand: the entity is &amp; and symbol character is &.
//Greater Than Sign: the entity is &gt; and symbol character is >.
//Less Than Sign: the entity is &lt; and symbol character is <.
//Slash: the entity is &frasl; and symbol character is /.
//Given the input text string to the HTML parser, you have to implement the entity parser.
//
//Return the text after replacing the entities by the special characters.
//
//
//
//Example 1:
//
//Input: text = "&amp; is an HTML entity but &ambassador; is not."
//Output: "& is an HTML entity but &ambassador; is not."
//Explanation: The parser will replace the &amp; entity by &
//Example 2:
//
//Input: text = "and I quote: &quot;...&quot;"
//Output: "and I quote: \"...\""
//Example 3:
//
//Input: text = "Stay home! Practice on Leetcode :)"
//Output: "Stay home! Practice on Leetcode :)"
//Example 4:
//
//Input: text = "x &gt; y &amp;&amp; x &lt; y is always false"
//Output: "x > y && x < y is always false"
//Example 5:
//
//Input: text = "leetcode.com&frasl;problemset&frasl;all"
//Output: "leetcode.com/problemset/all"
//
//
//Constraints:
//
//1 <= text.length <= 10^5
//The string may contain any possible characters out of all the 256 ASCII characters.
//
//
//5383. Number of Ways to Paint N × 3 Grid
//User Accepted:0
//User Tried:0
//Total Accepted:0
//Total Submissions:0
//Difficulty:Hard
//You have a grid of size n x 3 and you want to paint each cell of the grid with exactly one of the three colours: Red, Yellow or Green while making sure that no two adjacent cells have the same colour (i.e no two cells that share vertical or horizontal sides have the same colour).
//
//You are given n the number of rows of the grid.
//
//Return the number of ways you can paint this grid. As the answer may grow large, the answer must be computed modulo 10^9 + 7.
//
//
//
//Example 1:
//
//Input: n = 1
//Output: 12
//Explanation: There are 12 possible way to paint the grid as shown:
//
//Example 2:
//
//Input: n = 2
//Output: 54
//Example 3:
//
//Input: n = 3
//Output: 246
//Example 4:
//
//Input: n = 7
//Output: 106494
//Example 5:
//
//Input: n = 5000
//Output: 30228214
//
//
//Constraints:
//
//n == grid.length
//grid[i].length == 3
//1 <= n <= 5000
