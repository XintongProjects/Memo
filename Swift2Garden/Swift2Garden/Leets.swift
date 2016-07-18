//
//  Leets.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/18/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

func shortestDist (inout rooms:[[Int]]){
    for i in 0 ..< rooms.count {
        for j in 0 ..< rooms[i].count {
            if rooms[i][j] == 0 {
                dfsRooms(&rooms, i, j)
            }
        }
    }
}

func dfsRooms (inout rooms: [[Int]], _ i:Int, _ j: Int){
    let row:[Int] = [-1, 0, 0, 1]
    let col:[Int] = [0, -1, 1, 0]
    if (i < 0 || j < 0 || i > rooms.count || j > rooms.count)
    {
        return
    }
    for r in 0 ..< row.count {
        if rooms[i + row[r]][j + col[r]] + 1 > rooms[i][j]{
            rooms[i + row[r]][j + col[r]] = rooms[i][j] + 1;
            dfsRooms(&rooms, i + row[r], j + col[r])
        }
    }
}