import UIKit

//Arranging Coins
//You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.
//
//Given n, find the total number of full staircase rows that can be formed.
//
//n is a non-negative integer and fits within the range of a 32-bit signed integer.
//
//Example 1:
//
//n = 5
//
//The coins can form the following rows:
//¤
//¤ ¤
//¤ ¤
//
//Because the 3rd row is incomplete, we return 2.
//Example 2:
//
//n = 8
//
//The coins can form the following rows:
//¤
//¤ ¤
//¤ ¤ ¤
//¤ ¤
//
//Because the 4th row is incomplete, we return 3.

// Binary Search
//O(logN)
//O(1)
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            let mid = left + (right - left) / 2
            let curr = mid*(mid + 1)/2

            if curr == n {
                return mid
            }
            else if curr > n {
                right = mid - 1
            }
            else {
                left = mid + 1
            }
        }
        return right
    }
}

let sol = Solution()
print(sol.arrangeCoins(9))

//*
//**
//***
//****
//*****
//******
//F(0) = 0
//F(1) = 1
//F(2) = 1
//F(3) = 2
//F(4) = 2
//F(5) = 2
//F(6) = 3
//F(7) = 3
//F(8) = 3
//F(9) = 3
//F(10) = 4
//F(11) = 4
