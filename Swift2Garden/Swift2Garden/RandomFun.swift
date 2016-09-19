//
//  RandomFun.swift
//  Swift2Garden
//
//  Created by Cindy on 8/12/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation
// In swift many random utilities are based on UInt32
//0~n inclusive
func randomNum(_ n: Int) -> Int {
    let num = UInt32(n + 1)
    return Int(arc4random_uniform(num))
}

// random number between start and end, inclusive
// arc4random_uniform needs positive input
func randomIntFrom(_ start: Int, to end: Int) -> Int {
    var a = start
    var b = end
    // swap to prevent negative integer crashes
    if a > b {
        swap(&a, &b)
    }
    return Int(arc4random_uniform(UInt32(b - a + 1))) + a
}
