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
    
    let string1 = "hello world light"
    let strArr = string1.componentsSeparatedByString(" ")
    print (strArr)
    
    while let line: String = readLine() {
        var num:Int? = Int(line)
        num = num! * num!
        let ans =  String(num)
        print(ans)
    }
    
    
    while let line: String = readLine() {
        let pairs = line.componentsSeparatedByString(";")
        let count = pairs.count
        var dict = [String : String]()
        for i in 0 ..< count {
            //insert each pair into a dictionary
            let pair = pairs[i].componentsSeparatedByString("-")
            dict[pair[0]] = pair[1]
        }
        //validate the chain
        var isGoodChain = false;
        var key = "BEGIN"
        while (dict[key] != nil){
            let value = dict[key]
            dict.removeValueForKey(key)
            if value != "END"{
                
                key = value!
            }
            else { // value is "END"
                if dict.count == 0 {
                    isGoodChain = true
                    break
                }
            }
        }
        
        if isGoodChain {
            print("GOOD")
        }
        else{
            print("BAD")
        }
    }
//while let line: String = readLine() {
//    let line = "5\n0 2\n6 67\n43 71\n39 107\n189 140\n0"
//    let lines = "3\n0 0\n1 1\n2 3\n0"

//    let inputLines:[String] = lines.characters.split { $0 == "\n" || $0 == "\r\n" }.map(String.init)
//    print("inputLines:\(inputLines)")
//    let numPoints = inputLines.count - 2
//    // get a list of points from inputLines
//    var points:[[Double]] = [[]]
//    for i in 1 ... numPoints {
//        let pointString:[String] = inputLines[i].componentsSeparatedByString(" ")
//        var point = Array(count:2, repeatedValue:0.0)
//        point[0] = Double(pointString[0])!
//        point[1] = Double(pointString[1])!
//        points.append(point)
//    }
//    //An empty element is added first
//    points.removeFirst()
//    print("points:\(points)")
//    //calculate shortest path between 2 points. O(N square). Note self to self is 0
//    var minDist = 10000.0
//    for i in 0 ..< (points.count - 1) {
//        for j in 0 ..< points.count {
//            
//            let dist =  sqrt(pow(points[j][0] - points[i][0], 2) + pow(points[j][1] - points[i][1], 2))
//            if (dist != 0 && dist < minDist) {
//                minDist = dist
//            }
//        }
//    }
//    if minDist < 10000.0 {
//        let dist = Double(round(10000*minDist)/10000)
//        print("\(dist)")
//    }
//    else{
//        print("INFINITY")
//    }
//    
//    let line: String = "(1,6), (6,7), (2,7), (9,1)"
//    var isSqure = false
//    var newString = line.stringByReplacingOccurrencesOfString("), ", withString: ";")
//    newString = newString.stringByReplacingOccurrencesOfString("(", withString: "")
//    newString = newString.stringByReplacingOccurrencesOfString(")", withString: "") // to deal with a special case
//    let points = newString.componentsSeparatedByString(";")
//    print(points)
//    let num = points.count
//    guard (num == 4) else{
//        return
//    }
//    var arrOfInput = [Double]()
//    for item in points {
//        
//    }
    
    
    
        
    
        
        
//}
//    let sentence = "Line 1\nLine 2\nLine 3\n"
//    var sentenceLines:[String] = []
//    //sentence.enumerateLines { sentenceLines.append($0.line) }
//    sentenceLines = sentence.characters.split { $0 == "\n" || $0 == "\r\n" }.map(String.init)
//    ////////
//    var inputArr:[String] = []
//    sentence.enumerateLines {inputArr.append($0.line)}
//    
//    print(sentenceLines)
//    print(inputArr)
    
    
}

func isSqure(line:String){
    let line: String = "(1,6), (6,7), (2,7), (9,1)"
    var isSqure = false
    let charOfLine = line.characters.map{String($0)}
    var nums:[Double] = []
    for i in 0 ..< charOfLine.count{
        if charOfLine[i] >= "0" && charOfLine[i] <= "9" {
            nums.append(Double(charOfLine[i])!)
        }
    }
    guard nums.count == 8 else {
        print(false)
        return
    }
    //applies rule of right angle
    let d01 = pow(nums[2] - nums[0], 2) + pow(nums[3] - nums[1], 2)
    let d02 = pow(nums[4] - nums[0], 2) + pow(nums[5] - nums[1], 2)
    let d03 = pow(nums[6] - nums[0], 2) + pow(nums[7] - nums[1], 2)
    let d12 = pow(nums[4] - nums[2], 2) + pow(nums[5] - nums[3], 2)
    let d13 = pow(nums[6] - nums[2], 2) + pow(nums[7] - nums[3], 2)
    let d23 = pow(nums[6] - nums[4], 2) + pow(nums[7] - nums[5], 2)
    
    if d01 == d02 && d03 == d01 + d02 {
        isSqure = d23 == d13 && d23 == d01
    }
    else if d01 == d03 && d02 == d01 + d03 {
        isSqure = d12 == d23 && d12 == d01
    }
    else if d02 == d03 && d01 == d02 + d03{
        isSqure = d12 == d13 && d12 == d02
    }
    print(isSqure)
}

func getHint(secret: String, _ guess: String) -> String {
    var bull = 0
    var cow = 0
    let s = secret.characters.map{String($0) }
    let g = guess.characters.map{String($0)}
    let len = s.count
    var num:[Int] = [0,0,0,0,0,0,0,0,0,0]
    for i in 0 ..< len {
        if s[i] == g[i] {
            bull+=1
        }
        else{
            let indexS:Int? = Int(s[i])
            let indexG:Int? = Int(g[i])
            if num[indexS!] < 0 {
                cow += 1
            }
            if num[indexG!] > 0{
                cow += 1
            }
            num[indexS!] += 1
            num[indexG!] -= 1
        }
        
    }
    let str = "\(bull) bulls \(cow) cows"
    return str
}

//The following passed 411/450 test cases, still fails at
func isMatch(s: String, _ p: String) -> Bool {
    let charS = s.characters.map{String($0)}
    let charP = p.characters.map{String($0)}
    let sLen = charS.count
    let pLen = charP.count
    var dp = Array(count:sLen+1, repeatedValue:
        Array(count:pLen + 1, repeatedValue:false))
    dp[0][0] = true
    // init special case for *, when it can be treated as empty when previous is a match
    for i in 0 ..< pLen {
        if (charP[i] == "*" && dp[0][i-1] == true){
            dp[0][i] = true;
        }
    }
    for i in 0 ..< sLen {
        for j in 0 ..< pLen {
            if (charP[j] == "."){
                dp[i+1][j+1] = dp[i][j];
            }
            if (charP[j] == charS[i]){
                dp[i+1][j+1] = dp[i][j];
            }
            if(charP[j] == "*"){
                if (charP[j-1] != charS[i] && charP[j-1] != ".") {
                    dp[i+1][j+1] = dp[i+1][j-1];
                }
                else {
                    dp[i+1][j+1] = dp[i][j+1] || //a* represents mutiple aa...a
                        dp[i+1][j] || // a* represents 1a, ie. a
                        dp[i+1][j-1]; // a* represents empty ""
                }
            }//end if
        }// enf for j
    }//end for i
    return dp[sLen][pLen];
}

// 290 TODO
func wordPattern(pattern: String, _ str: String) -> Bool {
//    let letters = [Character] (pattern.characters)
//    let strArray = str.componentsSeparatedByString(" ")
//    var dictP = [Character : String]()
//    var dictS = [String : Character]()
////    for pChar in pattern.characters{
////        
// //   }
    return false
}
func sortedCharsInString (str:String) -> String{
    let sortedStr = String(Array(str.characters.sort()))
    return sortedStr
}

func findAnagramsOfWordInDictionary(word:String, words:[String]) ->[String]{
    let sorted = word.characters.sort()
    var result = [String]()
    for item in words {
        if item.characters.sort() == sorted {
            result.append(item)
        }
    }
    print(result)
    return result
}

func isAnagram(s: String, _ t: String) -> Bool {
    // ["alert", "alter", "later", "seal", "sale", "bob", "odd"]
    guard s.characters.count == t.characters.count else {
        return false
    }
    return s.characters.sort() == t.characters.sort()
}
func groupAnagrams(strs: [String]) -> [[String]] {
    var results = [[String]]()
    var dict = [String:[String]]()
    // add words into dict
    for item in strs {
        let str = String(Array(item.characters.sort()))
        if dict[str] == nil {
            var value = [String]()
            value.append(item)
            dict[str] = value
        }
        else {
            dict[str]?.append(item)
        }
    }
    for val in dict.values {
        results.append(val)
    }
    return results
}

//reverse int, e.g. 1234 -> 4321, need to get positive or negative
func reverseInt(input: Int) -> Int {
    var sign = 1
    var num = input
    if num < 0 {
        sign = -1
        num = 0 - num // convert to positive
    }
    var result: Int = 0
    while num > 0 {
        result = result * 10 + num % 10
        num = num / 10
    }
    return sign * result
}


// mainly about clarification, "    +-2  ", "42abc", smaller than "-2147483648"  greater than: "2147483647"
func myAtoi(str: String) -> Int {
    let charStr = Array(str.characters)
    var result = 0
    let len = charStr.count
    var index = 0
    var sign = 1
    while index < len && charStr[index] == " "{
        index += 1
    }
    if index < len && (charStr[index] == "-" || charStr[index] == "+" ){
        if charStr[index] == "-" {
            sign = -1
        }
        else if (charStr[index] == "+"){
            sign = 1
        }
        index += 1
    }
    while index < len && charStr[index] >= "0" && charStr[index] <= "9" {
        guard result < Int.max/10 -  Int(String(charStr[index]))! else{
            return 0
        }
        result = result * 10 + Int(String(charStr[index]))!
        index += 1
        if result * sign > 2147483647 {
            return 2147483647
        }
        else if result * sign < -2147483648{
            return -2147483648
        }
    }
    return sign * result
}

// leet 98. Validate Binary Search Tree
func isValidBST(root: TreeNode?) -> Bool {
    return isValidBST(root, Int.min, Int.max)
}

func isValidBST(root: TreeNode?, _ min:Int, _ max:Int) -> Bool {
    if (root == nil) {
        return true
    }
    else {
        return root!.val > min && root!.val < max && isValidBST(root!.left, min, root!.val) && isValidBST(root!.right, root!.val, max)
    }
}

func numIslands(grid: [[Character]]) -> Int {
    var num = 0
    let row = grid.count
    let col = grid[0].count
    
    return num
}

