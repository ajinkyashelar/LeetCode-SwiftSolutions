import UIKit

//LRU Cache
//Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
//
//get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
//put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
//
//The cache is initialized with a positive capacity.
//
//Follow up:
//Could you do both operations in O(1) time complexity?
//
//Example:
//
//LRUCache cache = new LRUCache( 2 /* capacity */ );
//
//cache.put(1, 1);
//cache.put(2, 2);
//cache.get(1);       // returns 1
//cache.put(3, 3);    // evicts key 2
//cache.get(2);       // returns -1 (not found)
//cache.put(4, 4);    // evicts key 1
//cache.get(1);       // returns -1 (not found)
//cache.get(3);       // returns 3
//cache.get(4);       // returns 4

class ListNode  {
    var next: ListNode?
    var prev: ListNode?
    var val: Int
    var key: Int
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    
    let capacity: Int
    var head: ListNode = ListNode(0, 0)
    var tail: ListNode = ListNode(0, 0)
    var dict: [Int:ListNode] = [:]
   
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let listNode = dict[key] {
            moveToBottom(listNode)
            return listNode.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let nodeFound = dict[key] {
            nodeFound.key = key
            nodeFound.val = value
            moveToBottom(nodeFound)
        }
        else {
            let newNode = ListNode(key,value)
            freeNodeIfNeeded()
            moveToBottom(newNode)
            dict[key] = newNode
        }
    }
    
    func freeNodeIfNeeded() {
        if let toBeRemoved = head.next, dict.count == capacity {
            head.next = toBeRemoved.next
            toBeRemoved.next?.prev = head
            dict[toBeRemoved.key] = nil
        }
    }
    
    func moveToBottom(_ node: ListNode){
        // remove current listNode from linked chain
        let prevListNode = node.prev
        let nextListNode = node.next
        prevListNode?.next = nextListNode
        nextListNode?.prev = prevListNode
        
        // shift current listNode to last position(previous of tail)
        let lastTailNode = tail.prev
        // connect with last node
        lastTailNode?.next = node
        node.prev = lastTailNode
        // connect with list node
        node.next = tail
        tail.prev = node
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
