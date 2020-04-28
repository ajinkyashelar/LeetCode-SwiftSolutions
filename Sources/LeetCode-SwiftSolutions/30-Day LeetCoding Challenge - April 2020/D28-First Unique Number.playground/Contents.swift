import UIKit

//First Unique Number
//
//You have a queue of integers, you need to retrieve the first unique integer in the queue.
//
//Implement the FirstUnique class:
//
//FirstUnique(int[] nums) Initializes the object with the numbers in the queue.
//int showFirstUnique() returns the value of the first unique integer of the queue, and returns -1 if there is no such integer.
//void add(int value) insert value to the queue.
//
//
//Example 1:
//
//Input:
//["FirstUnique","showFirstUnique","add","showFirstUnique","add","showFirstUnique","add","showFirstUnique"]
//[[[2,3,5]],[],[5],[],[2],[],[3],[]]
//Output:
//[null,2,null,2,null,3,null,-1]
//
//Explanation:
//FirstUnique firstUnique = new FirstUnique([2,3,5]);
//firstUnique.showFirstUnique(); // return 2
//firstUnique.add(5);            // the queue is now [2,3,5,5]
//firstUnique.showFirstUnique(); // return 2
//firstUnique.add(2);            // the queue is now [2,3,5,5,2]
//firstUnique.showFirstUnique(); // return 3
//firstUnique.add(3);            // the queue is now [2,3,5,5,2,3]
//firstUnique.showFirstUnique(); // return -1
//
//Example 2:
//
//Input:
//["FirstUnique","showFirstUnique","add","add","add","add","add","showFirstUnique"]
//[[[7,7,7,7,7,7]],[],[7],[3],[3],[7],[17],[]]
//Output:
//[null,-1,null,null,null,null,null,17]
//
//Explanation:
//FirstUnique firstUnique = new FirstUnique([7,7,7,7,7,7]);
//firstUnique.showFirstUnique(); // return -1
//firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7]
//firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3]
//firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3,3]
//firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7,3,3,7]
//firstUnique.add(17);           // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
//firstUnique.showFirstUnique(); // return 17
//
//Example 3:
//
//Input:
//["FirstUnique","showFirstUnique","add","showFirstUnique"]
//[[[809]],[],[809],[]]
//Output:
//[null,809,null,-1]
//
//Explanation:
//FirstUnique firstUnique = new FirstUnique([809]);
//firstUnique.showFirstUnique(); // return 809
//firstUnique.add(809);          // the queue is now [809,809]
//firstUnique.showFirstUnique(); // return -1
//
//
//
//Constraints:
//
//1 <= nums.length <= 10^5
//1 <= nums[i] <= 10^8
//1 <= value <= 10^8
//At most 50000 calls will be made to showFirstUnique and add.
//   Hide Hint #1
//Use doubly Linked list with hashmap of pointers to linked list nodes. add unique number to the linked list. When add is called check if the added number is unique then it have to be added to the linked list and if it is repeated remove it from the linked list if exists. When showFirstUnique is called retrieve the head of the linked list.
//   Hide Hint #2
//Use queue and check that first element of the queue is always unique.
//   Hide Hint #3
//Use set or heap to make running time of each function O(logn).

class Solution {
    
   var subSet : NSMutableOrderedSet = []

    init(_ nums: [Int]) {
        
        for i in 0..<nums.count {
            if subSet.contains(nums[i]){
                subSet.remove(nums[i])
            }
            else {
                subSet.insert(nums[i], at: subSet.count)
            }
        }
    }
    
    func showFirstUnique() -> Int {
        if subSet.count != 0 {
            return subSet[0] as! Int
        }
        else {
            return -1
        }
        
    }
    
    func add(_ value: Int) {
        if subSet.contains(value){
            subSet.remove(value)
        }
        else {
            subSet.insert(value, at: subSet.count)
        }
    }
}

//Doubly Linked List
class FirstUnique {
    
    var head: Node?
    var tail: Node?
    var map = [Int: Node?]()
    
    init(_ nums: [Int]) {
        for num in nums {
            add(num)
        }
    }
    
    func showFirstUnique() -> Int {
        return head?.value ?? -1
    }
    
    func add(_ value: Int) {
        if map[value] == nil {
            let newNode = Node(value: value, next: nil, previous: tail)
            tail?.next = newNode
            tail = newNode
            if head == nil { head = newNode }
            map[value] = newNode
        } else if map[value]! != nil {
            let removeNode = map[value]!
            
            if removeNode === head {
                head = removeNode?.next
            }
            if removeNode === tail {
                tail = removeNode?.previous
            }
            
            removeNode?.previous?.next = removeNode?.next
            removeNode?.next?.previous = removeNode?.previous
            
            map[value]! = nil
        }
    }
    
    class Node {
        var value: Int
        var next: Node?
        var previous: Node?
        
        init(value: Int, next: Node?, previous: Node?) {
            self.value = value
            self.next = next
            self.previous = previous
        }
    }
}


class FirstUniqueQueuSet {
    var firstUniques: [Int?] = [] // queue of uniques
    var hashMap: [Int: Int] = [:] // num: count (if 1 -> num exists)
    var indexHashMap: [Int: Int] = [:] // num: index

    init(_ nums: [Int]) {
        nums.forEach { num in
            if let _ = hashMap[num] {
                if let index = indexHashMap[num] {
                    firstUniques[index] = nil
                }
            } else {
                hashMap[num] = 1
                firstUniques.append(num)
                indexHashMap[num] = firstUniques.count - 1
            }
        }
    }

    func showFirstUnique() -> Int {
        return (firstUniques.first(where: { $0 != nil }) ?? -1) ?? -1
    }

    func add(_ value: Int) {
        if let _ = hashMap[value] {
            if let index = indexHashMap[value] {
                firstUniques[index] = nil
            }
        } else {
            hashMap[value] = 1
            firstUniques.append(value)
            indexHashMap[value] = firstUniques.count - 1
        }
    }
}
