import UIKit

//Min Stack
//Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//
//push(x) -- Push element x onto stack.
//pop() -- Removes the element on top of the stack.
//top() -- Get the top element.
//getMin() -- Retrieve the minimum element in the stack.
//
//
//Example:
//
//MinStack minStack = new MinStack();
//minStack.push(-2);
//minStack.push(0);
//minStack.push(-3);
//minStack.getMin();   --> Returns -3.
//minStack.pop();
//minStack.top();      --> Returns 0.
//minStack.getMin();   --> Returns -2.
//
//
//   Hide Hint #1
//Consider each node in the stack having a minimum value. (Credits to @aakarshmadhavan)

class MinStack {

    var stackArray : [Int] = []
    var minArray: [Int] = []
    /** initialize your data structure here. */
    init() {
        self.stackArray = []
        self.minArray = []
    }
    
    func push(_ x: Int) {
        stackArray.append(x)
        if minArray.isEmpty {
            minArray.append(x)
        }
        else if minArray.last! >= x {
            minArray.append(x)
        }
    }
    
    func pop() {
        if stackArray.count > 0 {
            let element = stackArray.removeLast()
            if element == minArray.last! {
                minArray.removeLast()
            }
        }
    }
    
    func top() -> Int {
        if stackArray.count > 0 {
            return stackArray[stackArray.count-1]
        }
        else {
            return Int.min
        }
        
    }
    
    func getMin() -> Int {
        if minArray.count > 0 {
            return minArray.last!
        }
        else {
            return Int.max
        }
    }
}


//Your MinStack object will be instantiated and called as such:
let obj = MinStack()
obj.push(6)
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()

