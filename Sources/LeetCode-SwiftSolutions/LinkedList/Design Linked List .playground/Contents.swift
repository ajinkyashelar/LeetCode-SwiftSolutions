import UIKit
//Design Linked List
//Solution
//Design your implementation of the linked list. You can choose to use the singly linked list or the doubly linked list. A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node. If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.
//
//Implement these functions in your linked list class:
//
//get(index) : Get the value of the index-th node in the linked list. If the index is invalid, return -1.
//addAtHead(val) : Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
//addAtTail(val) : Append a node of value val to the last element of the linked list.
//addAtIndex(index, val) : Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
//deleteAtIndex(index) : Delete the index-th node in the linked list, if the index is valid.
//
//
//Example:
//
//Input:
//["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]
//[[],[1],[3],[1,2],[1],[1],[1]]
//Output:
//[null,null,null,null,2,null,3]
//
//Explanation:
//MyLinkedList linkedList = new MyLinkedList(); // Initialize empty LinkedList
//linkedList.addAtHead(1);
//linkedList.addAtTail(3);
//linkedList.addAtIndex(1, 2);  // linked list becomes 1->2->3
//linkedList.get(1);            // returns 2
//linkedList.deleteAtIndex(1);  // now the linked list is 1->3
//linkedList.get(1);            // returns 3
//
//
//Constraints:
//
//0 <= index,val <= 1000
//Please do not use the built-in LinkedList library.
//At most 2000 calls will be made to get, addAtHead, addAtTail,  addAtIndex and deleteAtIndex.


class MyLinkedList {
    
    public var val : Int?
    public var next : MyLinkedList?

    /** Initialize your data structure here. */
    init() {
        self.val = nil
        self.next = nil
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var count = 0
        var temp = self
        while count < index {
            if temp.next != nil {
                count = count + 1
                temp = temp.next!
            }
            else {
                return -1
            }
        }
        return temp.val!
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let addHead : MyLinkedList = MyLinkedList()
        addHead.val = self.val
        addHead.next = self.next
        self.val = val
        if addHead.val != nil{
            self.next = addHead
        }
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let lastNode : MyLinkedList = MyLinkedList()
        lastNode.val = val
        var tempNode = self
        while tempNode.next != nil {
            tempNode = tempNode.next!
        }
        tempNode.next = lastNode
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        var count = 0
        let addNode : MyLinkedList = MyLinkedList()
        addNode.val = val
        var prevNode = self
        
        if index == 0 {
            addAtHead(val)
        }
        
        while count < index {
            count = count + 1
            if count == index {
                let nextNode = prevNode.next
                prevNode.next = addNode
                addNode.next = nextNode
            }
            if prevNode.next != nil {
                prevNode = prevNode.next!
            }
            else {
                return
            }
        }
        
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        var count = 0
        var prevNode = self
        
        if index == 0 {
            self.val = prevNode.next?.val
            self.next = prevNode.next
        }
        
        while count < index && prevNode.next != nil{
            count = count + 1
            if count == index {
                   let nextNode = prevNode.next?.next
                    prevNode.next = nextNode
            }
            if prevNode.next != nil {
                prevNode = prevNode.next!
            }
            
        }

       
    }
    
    
}

extension MyLinkedList {
    
    func printLinkedList(_ node : MyLinkedList) {
        var tempNode = node
        var printStr = ""
        while tempNode.next != nil {
            if tempNode.val != nil {
                printStr = printStr + "\(tempNode.val!)->"
            }
            else {
                printStr = printStr + "nil->"
            }
            tempNode = tempNode.next!
        }
        if tempNode.val != nil {
            printStr = printStr + "\(tempNode.val!)"
        }
        else {
            printStr = printStr + "nil"
        }
        print(printStr)
    }
    
}

class MyLinkedListArray { //Best Run Time

    private var list = [Int] ()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index >= 0 && index < list.count {
            return list[index]
        }
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        list.insert(val, at: 0)
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        list.append(val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == list.count {
            list.append(val)
        } else {
            if index >= 0 && index < list.count {
                list.insert(val, at: index)
            }
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= 0 && index < list.count {
            list.remove(at: index)
        }
    }
}


class MyLinkedListSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    var head: ListNode?
    var size: Int = 0

    /** Initialize your data structure here. */
    init() {
        head = nil
        size = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index < 0 || index >= size {
            return -1
        }
        var indexNode = head
        for _ in 0..<index {
            indexNode = indexNode!.next
        }
        return indexNode!.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newHead = ListNode(val)
        newHead.next = head
        head = newHead
        size += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        guard head != nil else {
            head = ListNode(val)
            return
        }
        let node = ListNode(val)
        var tailNode = head
        for _ in 0..<size-1 {
            tailNode = tailNode!.next
        }
        tailNode?.next = node
        size += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > size {
            return
        }
        if index <= 0 {
            addAtHead(val)
            size += 1
            return
        }
        let node = ListNode(val)
        var indexNode = head
        for _ in 0..<index-1 {
            indexNode = indexNode!.next
        }
        node.next = indexNode!.next
        indexNode!.next = node
        size += 1
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= size || index < 0 || size <= 0 {
            return
        }
        if index == 0 {
            head = head!.next
            return
        }
        var indexNode = head
        for _ in 0..<index-1 {
            indexNode = indexNode!.next
        }
        indexNode!.next = indexNode!.next!.next
        size -= 1
    }
}



//Your MyLinkedList object will be instantiated and called as such:
let index : Int = 3
let val = 7
let obj = MyLinkedList()
obj.addAtHead(2)
obj.printLinkedList(obj)
obj.deleteAtIndex(1)
obj.printLinkedList(obj)
obj.addAtHead(2)
obj.printLinkedList(obj)
obj.addAtHead(7)
obj.printLinkedList(obj)
obj.addAtHead(3)
obj.printLinkedList(obj)
obj.addAtHead(2)
obj.printLinkedList(obj)
obj.addAtHead(5)
obj.printLinkedList(obj)
obj.addAtTail(5)
obj.printLinkedList(obj)
print(obj.get(5))
obj.printLinkedList(obj)
obj.deleteAtIndex(6)
obj.printLinkedList(obj)
obj.deleteAtIndex(4)
obj.printLinkedList(obj)


//obj.addAtIndex(1, 2)
//obj.printLinkedList(obj)
//obj.get(1)
//obj.printLinkedList(obj)
//print(obj.get(5))
//obj.printLinkedList(obj)
//obj.addAtHead(0)
//obj.printLinkedList(obj)
//print(obj.get(2))
//obj.printLinkedList(obj)
//print(obj.get(5))
//obj.printLinkedList(obj)
//obj.addAtTail(4)
//obj.printLinkedList(obj)
//obj.addAtIndex(index, 5)

//obj.deleteAtIndex(index)
//obj.printLinkedList(obj)

//print(ret_1)


//["MyLinkedList","addAtHead","deleteAtIndex","addAtHead","addAtHead","addAtHead","addAtHead","addAtHead","addAtTail","get","deleteAtIndex","deleteAtIndex"]
//[[],[2],[1],[2],[7],[3],[2],[5],[5],[5],[6],[4]]

//["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]
//[[],[1],[3],[1,2],[1],[0],[0]]
//
//Output:
//[null,null,null,null,2,null,1]
//Expected:
//[null,null,null,null,2,null,2]

//["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]
//[[],[1],[3],[1,2],[1],[1],[1]]

//[null,null,null,null,3,null,3]
//[null,null,null,null,2,null,3]
 
//["MyLinkedList","addAtHead","addAtTail","addAtHead","addAtTail","addAtHead","addAtHead","get","addAtHead","get","get","addAtTail"]
//[[],[7],[7],[9],[8],[6],[0],[5],[0],[2],[5],[4]]
//
//Output:
//[null,null,null,null,null,null,null,8,null,9,7,null]
//Expected:
//[null,null,null,null,null,null,null,8,null,6,7,null]
