//
//  FunStuff.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/15/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

//A generic defination of Stack. Indeed Swift should provid this by default
struct Stack <T> {
    var items = [T]()
    mutating func push (_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T? {
        if (!items.isEmpty){
            return items.removeLast()
        }
        else {
            return nil
        }
    }
    mutating func peep() -> T? {
        if (!items.isEmpty) {
            return items.last!
        }
        else{
            return nil
        }
    }
    mutating func isEmpty() -> Bool {
        return items.isEmpty
    }
    
}

//A generic defination of Queue. Indeed Swift should provid this by default
struct Queue <T> {
    var items = [T]()
    mutating func offer (_ item: T) {
        items.append(item)
    }
    mutating func poll() -> T?{
        if !items.isEmpty{
            return items.removeFirst()
        }
        else{
            return nil
        }
    }
    mutating func isEmpty() -> Bool {
        return items.isEmpty
    }
}
