//The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,
//
//F(0) = 0,   F(1) = 1
//F(N) = F(N - 1) + F(N - 2), for N > 1.
//Given N, calculate F(N).

//Comments - Fibonacci Series with Recursion & Memoization.


class SolutionFibo {
    
    var cache : [Int:Int] = [:] //Memoizatiion
    
    func fib(_ N: Int) -> Int {
        
        var result : Int;
        if let value = cache[N]   {
            return value
        }
       
        if (N < 2) {
            result = N
        }
        else {
            
            result =  fib(N - 1) + fib(N - 2) //Recursion
        }
        cache[N] = result
        return result
    }
}

var fibo : SolutionFibo = SolutionFibo()

fibo.fib(20)
