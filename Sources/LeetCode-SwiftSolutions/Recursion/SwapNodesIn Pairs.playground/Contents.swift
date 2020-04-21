//Given a linked list, swap every two adjacent nodes and return its head.
//
//You may not modify the values in the list's nodes, only nodes itself may be changed.
//
//
//
//Example:
//
//Given 1->2->3->4, you should return the list as 2->1->4->3.

import UIKit


//* Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        if head?.next != nil
        {
            let temp = head?.val
            head?.val = head?.next?.val ?? 0
            head?.next?.val = temp ?? 0
        }
        
        
        if head?.next?.next != nil
        {
            swapPairs(head?.next?.next)
        }
            
        return head
    }
}
