import UIKit

//Given a two integers swap their content.
//

//INPUT var a = 5, var b  = 7
//OUTPUT var a = 7, var b  = 5

class Solution {
    
    //Simple method using third varialble using Generic data type
    func swapTwoValueTempVariableGeneric<T>(_ a: inout T, _ b: inout T){
        var temp : T?
        temp = a
        a = b
        b  = temp!
    }
    
    //Using arithmetic operators + & -. (may cause arithmetic overflow)
    func swapTwoIntgers(_ a: inout Int, _ b: inout Int) {
        a = a + b
        b = a - b
        a = a - b
    }

    //Using arithmetic operators * & /. (This will not work if any of the number is 0 and may cause arithmetic overflow)
    func swapTwoMultiplicaitonDivisionIntgers(_ a: inout Int, _ b: inout Int) {
        a = a * b
        b = a / b
        a = a / b
    }
    
    //Using bitwise XOR operator ^
    func swapTwoValuesXOR(_ a: inout Int, _ b: inout Int){
        a = a ^ b
        b = a ^ b
        a = a ^ b
    }
    
    //Using Swift tuples and generic type
    func swapTwoValuesTuplesGenric<T>( a: T, b: T) -> (a: T, b: T ){
        return (b, a)
    }
    
//    func swapTwoIntgersOneLine(_ a: inout Int, _ b: inout Int) {
//       a=a+b-(b=a)
//    }
//    func swapTwoValuesXOROneLine(_ a: inout Int, _ b: inout Int){
//        a^=b^=a^=b
//    }
}

let sol : Solution = Solution()
var a = 5
var b = 7
print(sol.swapTwoValuesTuplesGenric(a: a, b: b))
sol.swapTwoIntgers(&a, &b)
print("a: \(a), b: \(b)")
sol.swapTwoMultiplicaitonDivisionIntgers(&a, &b)
print("a: \(a), b: \(b)")
sol.swapTwoValuesXOR(&a, &b)
print("a: \(a), b: \(b)")



