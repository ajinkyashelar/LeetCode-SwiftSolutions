import UIKit



class Solution {
//    //Submitted
//    func isPowerOfFour(_ num: Int) -> Bool {
//        return num > 0 && (num & (num - 1)) == 0 && (num - 1) % 3 == 0
//    }
    //Best
    func isPowerOfFour(_ num: Int) -> Bool {
        guard num != 0 else {return false}
        guard num != 1 else {return true}
        
        if num > 1 {
            return num % 4 == 0 && isPowerOfFour(num / 4)
        }
        
        return false
    }

}

