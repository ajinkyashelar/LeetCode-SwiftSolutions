import UIKit
//Remove K Digits
//Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.
//
//Note:
//The length of num is less than 10002 and will be ≥ k.
//The given num does not contain any leading zero.
//Example 1:
//
//Input: num = "1432219", k = 3
//Output: "1219"
//Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
//Example 2:
//
//Input: num = "10200", k = 1
//Output: "200"
//Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
//Example 3:
//
//Input: num = "10", k = 2
//Output: "0"
//Explanation: Remove all the digits from the number and it is left with nothing which is 0.

class Solution {

    func removeKdigitsBest(_ num: String, _ k: Int) -> String {
        guard num.count > k && num.count < 10002 && num.count > 0 else {
            return "0"
        }
        var stack: [Character] = []
        var count: Int = k
        
        for char in num {
            while !stack.isEmpty && count > 0 && char < stack.last! {
                stack.removeLast()
                count -= 1
            }
            stack.append(char)
        }
        while count > 0 {
            stack.removeLast()
            count -= 1
        }
        var i = 0
        while i < stack.count && stack[i] == "0" {
            i += 1
        }
        
        let result = String(stack[i...])
        return result.isEmpty ? "0" : result
    }
    
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let arr : [Int] = num.map({Int(String($0))!})
        let result = getRemovedString(arr: arr, k: k)
        let resultReverse = getRemovedString(arr: arr.reversed(), k: k)
        print("Final", result, resultReverse)
        return result < resultReverse ? String(result) : String(resultReverse)
    }

    func getRemovedString(arr: [Int], k: Int) -> Int {
        var counter = k
        var numArr: [Int] = []
        if arr.count != 0 {
            numArr.append(arr[0])
        }
        for i in 1..<arr.count {
            print(numArr)
            print(counter)
            print("check", arr[i] )
            if counter == 0 {
                numArr.append(arr[i])
            }
            else {
                if numArr.last! >= arr[i]  {
                    print("else")
                    numArr.removeLast()
                    numArr.append(arr[i])
                }
                counter -= 1
            }
        }

        if counter != 0 {
            for (i, _) in numArr.enumerated() {
                if counter != 0 {
                    numArr.remove(at: i)
                    counter -= 1
                }
            }
        }
        var result = ""
        for s in numArr {
            result = result + String(s)
        }
        print(result)
        return Int(result) ?? 0
    }
}

let sl = Solution()
//print((sl.removeKdigits("1432219", 3)))
//print((sl.removeKdigits("10200", 1)))
print((sl.removeKdigits("112", 1)))
//print((sl.removeKdigits("9", 1)))
