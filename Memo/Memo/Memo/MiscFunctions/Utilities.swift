//
//  Utilities.swift
//  Memo
//
//  Created by Cindy Bi on 7/15/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

let stringRepresentation = [1, 2, 3].description
//A generic defination of Stack. Indeed Swift should provid this by default
struct Stack <Element>{
    var items = [Element]()
    mutating func push (item: Element){
        items.append(item)
    }
    mutating func pop() -> Element?{
        if (!items.isEmpty){
            return items.removeLast()
        }
        else{
            return nil
        }
    }
    mutating func peep() -> Element?{
        if (!items.isEmpty){
            return items.last!
        }
        else{
            return nil
        }
    }
    mutating func isEmpty() -> Bool{
        return items.isEmpty
    }
    
}

//A generic defination of Queue. Indeed Swift should provid this by default
struct Queue <Element>{
    var items = [Element]()
    mutating func offer (item: Element){
        items.append(item)
    }
    mutating func poll() -> Element?{
        if !items.isEmpty{
            return items.removeFirst()
        }
        else{
            return nil
        }
    }
    mutating func isEmpty() -> Bool{
        return items.isEmpty
    }
}