//
//  TreeNode.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/15/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

public class TreeNode{
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int){
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    func treeHeight (root: TreeNode?) -> Int {
        if (root == nil) {
           return 0
        }
        return max(treeHeight(root!.left) + 1, treeHeight(root!.right) + 1)
    }
    
    func isBalanced(root: TreeNode?) -> Bool {
        if (root == nil) {
            return true
        }
        return abs(treeHeight(root?.left) - treeHeight(root?.right)) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
        
    }
}
public class ColomnTreeNode{
    public var node: TreeNode
    public var col: Int
    
    public init(_ node: TreeNode , _ val: Int){
        self.col = val
        self.node = node
    }
}

// graph node
public class UndirectedGraphNode {
    var label: Int
    var neighbors: [UndirectedGraphNode]
    init (_ x: Int) {
        self.label = x;
        self.neighbors = [UndirectedGraphNode]();
    }
}

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


public class TNode{ //TernaryNode binary, ternary, tri
    var val: Int
    var left: TNode?
    var middle: TNode?
    var right: TNode?
    
    init(_ value: Int) {
        // perform some initialization here
        self.val = value
        self.left = nil
        self.middle = nil
        self.right = nil
    }
    
    init(value: Int, _ leftNode: TNode, _ middleNode: TNode, _ rightNode: TNode) {
        // perform some initialization here
        self.val = value
        self.left = leftNode
        self.middle = middleNode
        self.right = rightNode
    }
}

public class TTree { // Trinary Tree, ternary, zillow
    var root: TNode?
    
    init (rootNode: TNode) {
        self.root = rootNode
    }
    
    func insert (value: Int) {
        if self.root == nil {
            self.root = TNode(value)
        }
        else{
            self.root = insert(value, node: self.root!)
        }
    }
    func insert (value: Int, node: TNode) -> TNode {
        if (value < node.val){
            if(node.left == nil) {
                node.left = TNode.init(value)
            }
            else{
                insert(value, node: node.left!)
            }
        }
        if (value > node.val) {
            if node.right == nil {
                node.right = TNode(value)
            }
            else {
                insert(value, node: node.right!)
            }
        }
        else {// ==, middle
            if node.middle == nil {
                node.middle = TNode(value)
            }
            else{
                insert(value, node: node.middle!)
            }
        }
        return node;
    }
    public func delete (value: Int){
        self.root = delete(value, node: &self.root)
    }
    private func delete(value: Int, inout node: TNode?) -> TNode{
        if node != nil {
            if value < node!.val {
                node!.left = delete(value, node: &node!.left)
            }
            else if value > node!.val {
                node!.right = delete(value, node: &node!.right)
            }
            else { // value == node.value
                if (node!.middle != nil){
                    node!.middle = delete(value, node: &node!.middle)
                }
                else if node!.right != nil {
                    let minV = findMin(&node!.right!)
                    node!.val = minV
                    node!.right = delete(minV, node: &node!.right)
                }
                else {// left != nil, and the other 2 children is nil
                    node = node!.left
                }
            }
        }
        return node!
    }
    
    public func findMin (inout node: TNode) -> Int {
        while (node.left != nil){
            node = node.left!
        }
        return node.val
    }

    
}