//
//  misc.swift
//  Swift2Garden
//
//  Created by Cindy on 9/1/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

//        let count = 10
//        var sum = 0
//        var skipSum = 0
//        for i in 0 ... 10 {
//            sum += i
//        }
//        for i in 0.stride(to: count + 1, by: 2){
//            skipSum += i
//        }
//        print("sum:\(sum) skipSum:\(skipSum)")
func reverseList(_ head: ListNode?) -> ListNode? {
    var cur: ListNode? = head
    var pre: ListNode? = nil
    var fast: ListNode? = nil
    while (cur != nil){
        fast = cur?.next
        cur?.next = pre
        pre = cur
        cur = fast
    }
    return pre
}
