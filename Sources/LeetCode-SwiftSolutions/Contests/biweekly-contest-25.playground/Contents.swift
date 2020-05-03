import UIKit

var str = "Hello, playground"

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var result: [Bool] = []
        let max: Int = candies.max() ?? 0
        for i in candies {
            if i + extraCandies >= max {
                result.append(true)
            }
            else {
                result.append(false)
            }
        }
        
        return result
    }
    
    func maxDiff(_ num: Int) -> Int {
               let numStr = String(num)
               let firstReplace = 9
               var secondReplace = 1
               let arr : [Int] = numStr.compactMap{ $0.wholeNumberValue }
               var x = 0
            
               if arr.count != 0 {
                    x = arr[0]
                if x == 9 && arr.count > 1 {
                    x = arr[1]
                }
               }

               var firstNum: String = ""
               
               for (_,n) in arr.enumerated() {
                   
                   if n == x{
                       firstNum.append(String(firstReplace))
                   }
                   else {
                       firstNum.append(String(n))
                   }
               }
            
            
           
            for (i,n) in arr.enumerated() {
                if i == 0 {
                    if x == 1 && arr.count > 1 {
                        secondReplace = 0
                    }
                }
                else {
                    
                     secondReplace = n
                }
            }
            
    //        if arr.count != 0 {
    //             x = arr[0]
    //            if x == 1 && arr.count > 1 {
    //                secondReplace = 0
    //                x = arr[1]
    //            }
    //        }
            
            var secondNum: String = ""
            
            for (_,n) in arr.enumerated() {
                
                print(secondReplace)
                if n == x{
                    secondNum.append(String(secondReplace))
                    
                }
                else {
                    secondNum.append(String(n))
                }
            }
               
            print(secondNum)
               let a : Int = Int(firstNum) ?? 0
               let b : Int = Int(secondNum) ?? 0
               
            print(a, b)
               return a - b
           }

}


let si = Solution()
print(si.maxDiff(999))
print(si.maxDiff(1101057))
//
//8808050
//8700
