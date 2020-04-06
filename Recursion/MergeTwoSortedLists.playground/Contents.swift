import UIKit

//Merge Two Sorted Lists
//
//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4


//Definition for singly-linked list.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //print("Start")
        var returnList : ListNode? = nil
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        //print("l1 : \(l1!.val), l2 : \(l2!.val)")
         if l1!.val <= l2!.val {
            //print("IR l1 : \(l1!.val), l2 : \(l2!.val)")
            returnList = l1
            returnList!.next = mergeTwoLists(l1!.next, l2)
        }
        else {
            
            //print("R l1 : \(l1!.val), l2 : \(l2!.val)")
            returnList = l2
            returnList!.next  = mergeTwoLists(l1, l2!.next)
        }
            
        //print("out")
        //print(returnList?.val)
        //print(returnList?.next?.val)
        return returnList
    }
}
