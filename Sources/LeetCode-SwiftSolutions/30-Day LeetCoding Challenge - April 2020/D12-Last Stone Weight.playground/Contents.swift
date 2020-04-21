import UIKit

//Last Stone Weight
//We have a collection of stones, each stone has a positive integer weight.
//
//Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:
//
//If x == y, both stones are totally destroyed;
//If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.
//At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)
//
//
//
//Example 1:
//
//Input: [2,7,4,1,8,1]
//Output: 1
//Explanation:
//We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
//we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
//we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
//we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
//
//
//Note:
//
//1 <= stones.length <= 30
//1 <= stones[i] <= 1000
//
//   Hide Hint #1
//Simulate the process. We can do it with a heap, or by sorting some list of stones every time we take a turn.

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var result : Int = 0
        var sortedArray = stones.sorted()
        sortedArray = sortedArray.reversed()
        //print(sortedArray)
        if sortedArray.count > 1 {
            let x = sortedArray[0]
            let y = sortedArray[1]
            let diff = x - y
            sortedArray.remove(at: 0)
            sortedArray.remove(at: 0)
            if diff > 0 {
                sortedArray.insert(diff, at: 0)
            }
            result = lastStoneWeight(sortedArray)
        }
        else if sortedArray.count == 1 {
            result = result + sortedArray[0]
            sortedArray.remove(at: 0)
        }
        else {
            return result
        }
        return result
    }
    
    func lastStoneWeightBest(_ stones: [Int]) -> Int {
        if stones.isEmpty {
            return 0
        }
        else if stones.count == 1 {
            return stones[0]
        }
        else {
            return lastStoneWeight(process(stones))
        }
    }
    func process(_ arr: [Int]) -> [Int] {
        var tmp = arr
        tmp.sort(by: >)
        if arr.count == 1 {
            return tmp
        }
        if tmp[0] == tmp[1] {
            tmp.remove(at: 0)
            tmp.remove(at: 0)
        }
        else {
            let val = tmp[0] - tmp[1]
            tmp[0] = val
            tmp.remove(at: 1)
        }
        return tmp
    }
}

let sol : Solution = Solution()
print(sol.lastStoneWeight([2,17,4,1,10,1]))
