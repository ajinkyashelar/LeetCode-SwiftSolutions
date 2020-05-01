import UIKit

//First Bad Version
//You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//
//Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
//
//You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
//
//Example:
//
//Given n = 5, and version = 4 is the first bad version.
//
//call isBadVersion(3) -> false
//call isBadVersion(5) -> true
//call isBadVersion(4) -> true
//
//Then 4 is the first bad version.

 // The knows API is defined in the parent class VersionControl.
//    func isBadVersion(_ version: Int) -> Bool{}

class Solution  {
    func firstBadVersion(_ n: Int) -> Int {
        return checkMiddle(1,n)
    }
    
    func checkMiddle(_ startIndex: Int, _ endIndex: Int) -> Int {
        
        if startIndex == endIndex {
            return startIndex
        }
        
        let middle: Int = startIndex + (endIndex - startIndex)/2
        if isBadVersion(middle) == true {
            return checkMiddle(startIndex,middle)
        }
        else{
            if isBadVersion(middle+1) == true {
                return middle+1
            }
            else {
                return checkMiddle(middle, endIndex)
            }
        }
    }
    
    func isBadVersion(_ version: Int) -> Bool{
        return true
    }
    
    func firstBadVersionBest(_ n: Int) -> Int {
        var left = 0
        var right = n
        var middle = 0
        while left<right {
          middle = left + (right - left)/2
          if !isBadVersion(middle) {
            left = middle+1
          } else {
            right = middle
          }
         }
         return left
    }
}
