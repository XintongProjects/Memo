//
//  TreeNode.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/15/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation
class TreeNode{
    var val: Int
    var left: TreeNode
    var right: TreeNode
    
    
    init(value: Int, leftNode: TreeNode, rightNode:TreeNode) {
        // perform some initialization here
        val = value
        left = leftNode
        right = rightNode
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