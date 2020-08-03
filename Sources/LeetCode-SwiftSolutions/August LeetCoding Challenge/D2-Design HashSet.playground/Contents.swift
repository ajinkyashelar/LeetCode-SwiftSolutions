import UIKit

//Design HashSet
//Design a HashSet without using any built-in hash table libraries.
//
//To be specific, your design should include these functions:
//
//add(value): Insert a value into the HashSet.
//contains(value) : Return whether the value exists in the HashSet or not.
//remove(value): Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.
//
//Example:
//
//MyHashSet hashSet = new MyHashSet();
//hashSet.add(1);
//hashSet.add(2);
//hashSet.contains(1);    // returns true
//hashSet.contains(3);    // returns false (not found)
//hashSet.add(2);
//hashSet.contains(2);    // returns true
//hashSet.remove(2);
//hashSet.contains(2);    // returns false (already removed)
//
//Note:
//
//All values will be in the range of [0, 1000000].
//The number of operations will be in the range of [1, 10000].
//Please do not use the built-in HashSet library.

class MyHashSet {

    /** Initialize your data structure here. */
    
    private static let kBucketSet = 1000
    
    private  var array : [[Int]] = [[Int]](repeating: [Int](), count: MyHashSet.kBucketSet)
    
    private func hash(key: Int) -> Int {
        return key % MyHashSet.kBucketSet
    }
    
    init() {
        array = [[Int]](repeating: [Int](), count: MyHashSet.kBucketSet)
    }
    
    func add(_ key: Int) {
        guard !contains(key) else { return }
        let hashValue = hash(key: key)
        array[hashValue].append(key)
    }
    
    func remove(_ key: Int) {
        guard contains(key) else {return}
        let hashValue = hash(key: key)
        array[hashValue].removeAll{ (val) -> Bool in
            val == key
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hashValue = hash(key: key)
        let first = array[hashValue].first { (val) -> Bool in
            val == key
        }
        return first != nil
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
