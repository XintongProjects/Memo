//
//  FunStrings.swift
//  Swift2Garden
//
//  Created by Cindy on 9/1/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

func stringExperiments() {
    let s = "[1,2,[15, [3, 4]]"
    let separators = NSCharacterSet(charactersInString: "[], ")
    var components = s.componentsSeparatedByCharactersInSet(separators)
    var result = [String]()
    for i in 0 ..< components.count {
        if components[i] != "" {
            result.append(components[i])
        }
    }
    print("new string is \(result)");
}

let map = [" ","", "abc", "def","ghi","jkl", "mno", "pqrs", "tuv", "wxyz"]
func letterCombinations(digits: String) -> [String] {
    var res = [String]();
    if digits.characters.count == 0 {
        return res
    }
    var entry = ""
    dfs(digits, 0, &entry, &res)
    return res;
}
func dfs(digits: String, _ level: Int, inout _ temp: String, inout _ res:[String]) {
    if(level == digits.characters.count){
        res.append(temp)
    }
    else{
        let index = Int(String(digits[digits.startIndex.advancedBy(level)]))
        let str = map[index!]
        for c in str.characters {
            var t = temp + String(c)
            dfs(digits, level + 1, &t, &res)
        }
    }
}