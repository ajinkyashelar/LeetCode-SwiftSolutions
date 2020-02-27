//Reverse Linked List
//Solution
//Reverse a singly linked list.
//
//Example:
//
//Input: 1->2->3->4->5->NULL
//Output: 5->4->3->2->1->NULL
//Follow up:
//
//A linked list can be reversed either iteratively or recursively. Could you implement both?

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
    
    func reverseList(_ head: ListNode?) -> ListNode? {
    
        if head == nil || head?.next == nil {
            
            return head
        }

        let rest : ListNode? = reverseList(head?.next)
        head?.next?.next = head;
        head?.next = nil;
        return rest
    }
    
}

let head : ListNode = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)

print(head.val)
let obj : Solution = Solution()
print(obj.reverseList(head)!.val)
