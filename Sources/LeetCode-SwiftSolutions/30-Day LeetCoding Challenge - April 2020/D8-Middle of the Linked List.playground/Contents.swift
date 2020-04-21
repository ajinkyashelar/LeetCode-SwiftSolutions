import UIKit
//
//Middle of the Linked List
//
//Given a non-empty, singly linked list with head node head, return a middle node of linked list.
//
//If there are two middle nodes, return the second middle node.
//
//
//
//Example 1:
//
//Input: [1,2,3,4,5]
//Output: Node 3 from this list (Serialization: [3,4,5])
//The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
//Note that we returned a ListNode object ans, such that:
//ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
//Example 2:
//
//Input: [1,2,3,4,5,6]
//Output: Node 4 from this list (Serialization: [4,5,6])
//Since the list has two middle nodes with values 3 and 4, we return the second one.
//
//
//Note:
//
//The number of nodes in the given list will be between 1 and 100.

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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var count : Int = 1
        var returnHead : ListNode? = head
        while returnHead?.next != nil {
            count = count + 1
            returnHead = returnHead?.next
        }
        returnHead = head
        count = count/2
        for _ in 0..<count {
            returnHead = returnHead?.next
        }
        return returnHead
    }
    
    func middleNodeBestSolution(_ head: ListNode?) -> ListNode? {
        var array = [ListNode]()
        var head = head
        
        while (head != nil) {
            array.append(head!)
            head = head!.next
        }
        
        return array[array.count/2]
    }
    
    func middleNodePointer(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        var slowPointer = head
        var fastPointer = head
        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        return slowPointer
    }
}

let sol : Solution = Solution()
var ll : ListNode = ListNode(1)
ll.next = ListNode(2)
ll.next?.next = ListNode(3)
ll.next?.next?.next = ListNode(4)
ll.next?.next?.next?.next = ListNode(5)
ll.next?.next?.next?.next?.next = ListNode(6)
print(sol.middleNode(ll)?.val ?? 0)
print(sol.middleNodeBestSolution(ll)?.val ?? 0)
print(sol.middleNodePointer(ll)?.val ?? 0)
