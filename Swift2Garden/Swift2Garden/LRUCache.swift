//
//  LRU.swift
//  Swift2Garden
//
//  Created by Cindy on 6/27/17.
//  Copyright © 2017 XintongBi. All rights reserved.
//

import Foundation

private class Node <T> {
    var next: Node?
    var pre: Node?
    var val: T
    init (value: T) {
        val = value
    }
}

public class LRU {
    
    
}
