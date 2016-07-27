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
}

class BTreeNode{
    var val: Int
    var left: BTreeNode
    var right: BTreeNode
    
    
    init(value: Int, leftNode: BTreeNode, rightNode:BTreeNode) {
        // perform some initialization here
        val = value
        left = leftNode
        right = rightNode
    }
}
class Codec{
    func serialize(root: TreeNode) -> String{
    
        return ""
    }
}