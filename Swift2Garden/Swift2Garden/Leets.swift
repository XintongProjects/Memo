//
//  Leets.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/18/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

func wallsAndGates(inout rooms: [[Int]]) {
    guard (rooms.count > 0) else{
        return
    }
    let m = rooms.count
    let n = rooms[0].count
    for i in 0 ..< rooms.count{
        for j in 0 ..< rooms[0].count{
            if rooms[i][j] == 0 {
                wallsAndGatesHelper(&rooms, m, n, i, j, 0)
            }
        }
    }
}

func wallsAndGatesHelper(inout rooms: [[Int]], _ row: Int, _ col: Int, _ i: Int, _ j: Int, _ val: Int){
    rooms[i][j] = val
    let index: [Int] = [-1, 0, 1, 0, -1]
    let value = val + 1
    for p in 0 ..< 4 {
        let r = i + index[p]
        let c = j + index[p+1]
        if (r >= 0 && r < row && c >= 0 && c < col && rooms[r][c] > value){
            wallsAndGatesHelper(&rooms, row, col, r, c, value)
        }
    }
}

func wallsAndGatesBFS(inout rooms: [[Int]]) {
    guard (rooms.count > 0) else{
        return
    }
    var queue:[Int] = [];
    let row = rooms.count
    let col = rooms[0].count
    for i in 0 ..< row {
        for j in 0 ..< col {
            if rooms[i][j] == 0 {
                queue.append(i*col + j)
            }
        }
    }
    let index = [-1, 0, 1, 0, -1]
    while queue.count > 0 {
        //remove the first element in queue, and check if it's 4 adjencents is bigger than the popped value + 1
        let i = queue[0] / col
        let j = queue[0] % col
        queue.removeAtIndex(0)
        for q in 0 ..< 4 {
            let r = i + index[q]
            let c = j + index[q+1]
            if (r >= 0 && c >= 0 && r < row && c < col){
                if  rooms[r][c] == Int.max {
                    rooms[r][c] = rooms[i][j] + 1
                    queue.append(r * col + c)
                }
            }
        }
        
    }
}

func processFirstName (){
    let people: [[String:String]] = [
        [
            "firstName": "Calvin",
            "lastName": "Newton"
        ],
        [
            "firstName": "Garry",
            "lastName": "Mckenzie"
        ],
        [
            "firstName": "Leah",
            "lastName": "Rivera"
        ],
        [
            "firstName": "Sonja",
            "lastName": "Moreno"
        ],
        [
            "firstName": "Noel",
            "lastName": "Bowen"
        ]
    ]
    
    var firstNames: [String] = []
    for person in people {
        let val = person["firstName"]
        firstNames.append(val!)
    }
}
//314
func verticalOrder (root: TreeNode?) ->[[Int]]{
    var results:[[Int]] = [[]]
    var col = 0
    var list:[Int] = []
    var dict: Dictionary <Int, [Int]> = [col:list]
    traverseTree(root, dict)
    return results
}
// for 314
func traverseTree(root: TreeNode?, inout dict:Dictionary<Int, [Int]>){
    
}