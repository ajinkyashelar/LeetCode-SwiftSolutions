import UIKit

//2. Add Two Numbers
//
//Medium
//
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example:
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.


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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry : Int = 0
        var l3 : ListNode?
        var l1 = l1
        var l2 = l2
        repeat {
            var sum : Int = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum >= 10 ? 1 : 0
            sum = sum % 10
            if l3?.val == nil {
                l3 = ListNode(sum)
            }
            else {
                var templ3 = l3
                while templ3?.next != nil {
                    templ3 = templ3?.next
                }
                templ3?.next = ListNode(sum)
            }
            l1 = l1?.next
            l2 = l2?.next
        } while l1?.val != nil || l2?.val != nil
        
        if carry == 1 {
            l3?.next = ListNode(carry)
        }
        return l3
    }
    
    func addTwoNumbersBest(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var current = head
        var carry = 0
        var l1 = l1
        var l2 = l2
        while l1 != nil || l2 != nil || carry > 0 {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            var next = ListNode(sum % 10)
            carry = sum / 10
            current.next = next
            current = next
            l1 = l1?.next
            l2 = l2?.next
        }
        return head.next
    }
}
