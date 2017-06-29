//
//  LRUCache.swift
//  Swift2Garden
//
//  Created by Cindy on 6/27/17.
//  Copyright © 2017 XintongBi. All rights reserved.
/*
 
 146. LRU Cache
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 
 Follow up:
 Could you do both operations in O(1) time complexity?
 
 Example:
 
 LRUCache cache = new LRUCache( 2 /* capacity */ );
 
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4

 */

import Foundation

// not tested
class Node: Hashable { //must use class, as next/prev is self ref, which not supported in struct as of Swift3
    var next: Node?
    var pre: Node?
    var val: Int = 0
    var key: Int = 0
    
    init (key: Int, val: Int) {
        self.val = val
        self.key = key
    }
    
    var hashValue: Int {
        return val.hashValue
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
}

public class LRUCache {
    var head: Node? = nil
    var tail: Node? = nil
    var table = [Int: Node]()
    var capacity: Int
    
    init(with cap: Int) {
        capacity = cap
    }
    
    func put(key: Int, value: Int) {
        let n = Node(key: key, val: value)
        if table[key] != nil {
            moveToHead(node: n)
        }
        else {
            table[key] = n
            if table.count >= capacity {
                if let ta = tail {
                    remove(node: ta)
                    table[ta.key] = nil
                }
            }
            addToHead(node: n)
        }
    }
    
    func get(id: Int) -> Int {
        if let n = table[id] {
            moveToHead(node: n)
            return n.val
        }
        return -1
    }
    
    func addToHead (node: Node) {
        if head == nil {
            head = node
        }
        else {
            head?.pre = node
            node.next = head
            head = node
        }
        if tail == nil {
            tail = node
        }
    }
    
    func moveToHead (node: Node) {
        if node != head {
            remove(node: node)
            addToHead(node: node)
        }
    }
    
    func remove(node: Node) {
        if node.pre != nil {
            node.pre?.next = node.next
        } else {
            head = node.next
        }
        
        if node.next != nil {
            node.next?.pre = node.pre
        } else {
            tail = node.pre
        }
    }
}
