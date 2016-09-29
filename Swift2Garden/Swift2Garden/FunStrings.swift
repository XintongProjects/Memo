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
    let separators = CharacterSet(charactersIn: "[], ")
    var components = s.components(separatedBy: separators)
    var result = [String]()
    for i in 0 ..< components.count {
        if components[i] != "" {
            result.append(components[i])
        }
    }
    print("new string is \(result)");
}

let map = [" ","", "abc", "def","ghi","jkl", "mno", "pqrs", "tuv", "wxyz"]
func letterCombinations(_ digits: String) -> [String] {
    var res = [String]();
    if digits.characters.count == 0 {
        return res
    }
    var entry = ""
    dfs(digits, 0, &entry, &res)
    return res;
}
func dfs(_ digits: String, _ level: Int, _ temp: inout String, _ res:inout [String]) {
    if(level == digits.characters.count){
        res.append(temp)
    }
    else{
        let index = Int(String(digits[digits.characters.index(digits.startIndex, offsetBy: level)]))
        let str = map[index!]
        for c in str.characters {
            var t = temp + String(c)
            dfs(digits, level + 1, &t, &res)
        }
    }
}

//20. Valid Parentheses ---  '(', ')', '{', '}', '[' and ']',
func isValid(_ s: String) -> Bool {
    var stack = [Character]() // using char array to mimic stack
    for char in s.characters {
        if char == "(" || char == "{" || char == "["  {
            stack.append(char)
        }
        if char == ")" {
            if stack[stack.endIndex - 1] == "(" {
                stack.removeLast()
            }
        }
        if char == "}" {
            if stack[stack.endIndex - 1] == "{" {
                stack.removeLast()
            }
        }
        if char == "]" {
            if stack[stack.endIndex - 1] == "[" {
                stack.removeLast()
            }
        }
    }
    return stack.isEmpty
}

//reverse words in String, trim excessive white spaces. "  Hello    World  " ->"World Hello"
func reverseWords(_ str:String) -> String {
    let len = str.characters.count
    if len == 0 {return ""}
    var result = String()
    var chars = Array(str.characters)
    var words = [String]()
    var s = String()
    for start in 0 ..< len {
        if chars[start] != " " && chars[start] != "\n" {
            s += String(chars[start])
        }
        else{
            if s.characters.count != 0 {
                words.append(s)
            }
            s = ""
        }
    }
    words = words.reversed()
    if(words.count) > 0 {
        result += words[0]
    }
    if(words.count > 1){
        for i in 1 ..< words.count{
            result =  result + " " + words[i]
        }
    }
    return result
}







