import UIKit

//Valid Parenthesis String
//Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
//
//Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//Any right parenthesis ')' must have a corresponding left parenthesis '('.
//Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
//An empty string is also valid.
//Example 1:
//Input: "()"
//Output: True
//Example 2:
//Input: "(*)"
//Output: True
//Example 3:
//Input: "(*))"
//Output: True
//Note:
//The string size will be in the range [1, 100].

class Solution {
    func checkValidString(_ s: String) -> Bool {
       
        let stringArray : [String] = s.map({String($0)})
        var stack : [String] = []
        for char in stringArray {
            if char == "(" || char == "*" {
                stack.append(char)
            }
            else {
                if let t = stack.lastIndex(of: "(") {
                    stack.remove(at: t)
                }
                else if let t = stack.lastIndex(of: "*") {
                    stack.remove(at: t)
                }
                else {
                    return false
                }
            }
        }
        while let t = stack.popLast() {
            if t == "(" {
                return false
            }
            if let t = stack.lastIndex(of: "(") {
                stack.remove(at: t)
            }
        }
        return stack.isEmpty
    }
    
    func checkValidStringBest(_ s: String) -> Bool {
           var t = (0, 0)
           for c in s {
               t.1 += (c != ")" ? 1 : -1)
               if t.1 < 0 { return false }
               t.0 += (c == "(" ? 1 : -1)
               t.0 = max(t.0, 0)
           }
           return t.0 == 0
    }
    
    func checkValidStringBestTime(_ s: String) -> Bool {
        var numsOpen = 0
        for c in s {
            if c != ")" {
                numsOpen += 1
            } else {
                numsOpen -= 1
            }
            if numsOpen < 0 {
                return false
            }
        }
        
        numsOpen = 0
        for c in s.reversed() {
             if c != "(" {
                numsOpen += 1
            } else {
                numsOpen -= 1
            }
            if numsOpen < 0 {
                return false
            }
        }
        
        return true
    }
}

let sol : Solution = Solution()
print(sol.checkValidString("(*)"))
print(sol.checkValidStringBest("(*)"))
