//
//  Leets.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/18/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

//optimized from 2d dp
//use one-d dp, top down. Bottom up will return same result. O(n) space nxn time given input is n*n grid
func minPathSum(grid: [[Int]]) -> Int {
    let row = grid.count
    guard row > 0 else{
        return 0
    }
    let col = grid[0].count
    var dp = Array(count: col, repeatedValue: 0)
    dp[0] = grid[0][0]
    // init based on first row
    for i in 1 ..< col {
        dp[i] = dp[i - 1] + grid[0][i]
    }
    // fun starts
    for i in 1 ..< row {
        for j in 0 ..< col {
            if (j == 0) {
                dp[j] = dp[j] + grid[i][j]
            }
            else {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
            }
        }
    }
    return dp[col - 1]
}
// 求矩阵中房间到门的最短距离. 以门为起始点。
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
// DFS
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
    var queue = [Int]();
    let row = rooms.count
    let col = rooms[0].count
    for i in 0 ..< row {
        for j in 0 ..< col {
            if rooms[i][j] == 0 {
                queue.append(i*col + j) // encode row and col number using one number
            }
        }
    }
    let index = [-1, 0, 1, 0, -1]
    while queue.count > 0 {
        //remove the first element in queue, and check if it's 4 adjencents is bigger than the popped value + 1
        let i = queue[0] / col // decode row and col number based on the number previously encoded
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

//string manipulations
func stringsExperiment() {
    let string1 = "hello world light light"
    var strArr = string1.componentsSeparatedByString(" ")
    strArr = strArr.reverse()
    print (strArr) // ["light", "light", "world", "hello"]
    let stringRepresentation = strArr.joinWithSeparator("-")
    print(stringRepresentation)
    let set = Set(strArr)
    print(set) //["light", "hello", "world"]
    let arrSet = Array(set)
    print(arrSet) //["light", "hello", "world"]
    let num1 = Int("127")
    let num2 = Int("abc")
    if (num2 == nil){
        print("Invalid format")
    }
    if (num1 > num2) {
        print("\(num1)> \(num2)")
    }
    
//    for index in (0..<5).reverse()
//    {
//        print(index) // 4 3 2 1 0
//    }
    let str = "ABCDEFG"
    let index = str.startIndex.advancedBy(2)
    print(str[index]) //"C"
    print(str.substringToIndex(index)) //AB
    print(str.substringFromIndex(index)) // CDEFG
    let index2 = str.startIndex.advancedBy(3)
    print(str.substringFromIndex(index2))// DEFG
}

//permutation, ask if allow duplicates. Can consider using set
public func permuteString(str: String)-> [String] {
    var result = [String]()
    var input = str
    var sofar = ""
    recPermuteString(&sofar, rest: &input, result: &result)
    // get rid of duplicates
    let set = Set(result)
    result.removeAll()
    for item in set {
        result.append(item)
    }
    print(result)
    return result
}

private func recPermuteString(inout sofar: String, inout rest: String, inout result:[String]) {
    if rest == "" {
        result.append(sofar)
    }
    else{
        for i in 0 ..< rest.characters.count {
            let index = rest.startIndex.advancedBy(i)
            var cur = sofar + String(rest[index])
            let remainIndex = rest.startIndex.advancedBy(i+1)
            var remain = rest.substringToIndex(index) + rest.substringFromIndex(remainIndex)
            recPermuteString(&cur, rest: &remain, result: &result)
        }
    }
}

//permute string using set
public func permuteStringViaSet(str: String) -> [String] {
    var set = Set<String>()
    var input = str
    var sofar = ""
    recPermuteStringViaSet(&sofar, rest: &input, result: &set)
    var result = [String]()
    for item in set {
        result.append(item)
    }
    print(result)
    return result
}

private func recPermuteStringViaSet(inout sofar: String, inout rest: String, inout result: Set<String>){
    if rest == "" {
        result.insert(sofar)
    }
    for i in 0 ..< rest.characters.count {
        let index = rest.startIndex.advancedBy(i)
        let remainIndex = rest.startIndex.advancedBy(i+1)
        var current = sofar + String(rest[index])
        var remain = rest.substringToIndex(index) + rest.substringFromIndex(remainIndex)
        recPermuteStringViaSet(&current, rest: &remain, result: &result)
    }
}

// random syntax or func check
func experiments() {
    
    while let line: String = readLine() {
        var num:Int? = Int(line)
        num = num! * num!
        let ans =  String(num)
        print(ans)
    }
    
    // check if input pairs can form a valid graph
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
    //应用勾股玄定理
    let d01 = pow(nums[2] - nums[0], 2) + pow(nums[3] - nums[1], 2)
    let d02 = pow(nums[4] - nums[0], 2) + pow(nums[5] - nums[1], 2)
    let d03 = pow(nums[6] - nums[0], 2) + pow(nums[7] - nums[1], 2)
    let d12 = pow(nums[4] - nums[2], 2) + pow(nums[5] - nums[3], 2)
    let d13 = pow(nums[6] - nums[2], 2) + pow(nums[7] - nums[3], 2)
    let d23 = pow(nums[6] - nums[4], 2) + pow(nums[7] - nums[5], 2)
    //note: in 2d space, make sure the 2 triangles are not the same. 
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
    let s = secret.characters.map{String($0)} //["1", "8", "7"]
    //let s2 = Array(arrayLiteral: String(secret.characters))//["187"]
    let g = guess.characters.map{String($0)}
    //let g2 = Array(arrayLiteral:String(guess.characters))//guess.characters.map{String($0)}

    
    let len = s.count
    var num:[Int] = [0,0,0,0,0,0,0,0,0,0]
    for i in 0 ..< len {
        if s[i] == g[i] {
            bull += 1
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
    print(str)
    return str
}

//The following passed 411/450 test cases, still fails at some 
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

// 128. It needs to find numbers that are consequtive. It does not matter if they are next to each other in the original array. Things can get better and better!
func longestConsecutive(nums: [Int]) -> Int {
    var set = Set(nums) // I love Swift
    var max = 0
    for i in 0 ..< nums.count {
        if (set.contains(nums[i])) {
            var left = nums[i] - 1
            var right = nums[i] + 1
            set.remove(nums[i])
            
            while set.contains(left) {
                set.remove(left)
                left -= 1
            }
            while set.contains(right) {
                set.remove(right)
                right += 1
            }
            
            let distance = right - left - 1
            if distance > max {
                max = distance
            }
        }
    }
    return max
}


func sortedCharsInString (str:String) -> String{
    let sortedStr = String(Array(str.characters.sort()))
    return sortedStr
}

func findDominatorInArray(arr:[Int]) ->Int{
    guard arr.count > 0 else {
        return Int.min
    }
    var result = arr[0]
    var dict = [Int: Int]()
    for item in arr {
        if dict[item] == nil {
            dict[item] = 1
        }
        else {
            dict[item] = dict[item]! + 1
        }
    }
    // get the key with max value
    for (key, value) in dict {
        if value == dict.values.maxElement() {
            result = key
        }
    }
    return result
}

func findAnagramsOfWordInDictionary(word:String, words:[String]) ->[String]{
    let sorted = word.characters.sort()
    var result = [String]()
    for item in words {
        if item.characters.sort() == sorted {
            result.append(item)
        }
    }
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
    //print(charStr) //str "8879" -> charStr["8", "8", "7", "9"]
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

func myItoA(n: Int) -> String
{
    let s = [""]
    print(s)
    return String(n)
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
// char '0' and '1'
func numIslands(grid: [[Character]]) -> Int {
    var map = grid
    var num = 0
    let row = map.count
    if row == 0 {
        return 0
    }
    let col = map[0].count
    
    for i in 0 ..< row {
        for j in 0 ..< col {
            if map[i][j] == "1" {
                num += 1
                traverseNeighbors(&map, i, j)
            }
        }
    }
    return num
}

func traverseNeighbors (inout map: [[Character]], _ m: Int, _ n:Int){
    let row = map.count
    let col = map[0].count
    while m >= 0 && m < row && n >= 0 && n < col && map[m][n] == "1" {
        map[m][n] = "2"
        let a = [-1, 0, 0, 1]
        let b = [0, -1, 1, 0]
        for i in 0 ..< 4 {
            traverseNeighbors(&map, m + a[i], n + b[i])
        }
    }
}

func mergeTwoLists(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    var cur1 = l1
    var cur2 = l2
    let head = ListNode(0) // made a dummy node for ease of manipulation
    var cur3 = head
    while (cur1 != nil && cur2 != nil){
        if cur1?.val < cur2!.val {
            cur3.next = cur1
            cur1 = cur1?.next
        }
        else{
            cur3.next = cur2
            cur2 = cur2?.next
        }
        cur3 = cur3.next!
    }
    if cur1 == nil {
        cur3.next = cur2
    }
    else if cur2 == nil {
        cur3.next = cur1
    }
    return head.next
}

func findFirstUniqueChar (str: String) -> Character?{
    let arr = Array(str.characters)
    var dict = [Character:Int]()
    for char in arr {
        if dict[char] != nil {
            dict[char] = 1 + dict[char]!
        }
        else {
            dict[char] = 1
        }
    }
    for i in 0 ..< arr.count {
        if dict[arr[i]] == 1 {
            return arr[i]
        }
    }
    return nil
}

// Kth Smallest Element in a Sorted Matrix
// assume k < row * col
// using priority queue logic, need to sort before dequeue the smallest
func kthSmallest(matrix: [[Int]], _ k: Int) -> Int {
    guard !matrix.isEmpty else {
        print("Empty matrix")
        return Int.min
    }
    var priQueue = [Entry]()
    var total = 0
    let p = Entry(row: 0, col: 0, value: matrix[0][0])
    priQueue.append(p)
    var top = p
    while total < k  && !priQueue.isEmpty {
        top = priQueue.removeFirst()
        
        if top.n + 1 < matrix.count {
            priQueue.append(Entry(row: top.m, col: top.n + 1, value: matrix[top.m][top.n + 1]))
        }
        if top.m + 1 < matrix.count {
            priQueue.append(Entry(row: top.m + 1, col: top.n, value: matrix[top.m + 1][top.n]))
        }
        //TOME: sort objects by property
        priQueue.sortInPlace({$0.val > $1.val})
        total += 1
    }
    return top.val
}
// this class is for func kthSmallest
private class Entry {
    var m = 0
    var n = 0
    var val = 0
    init(row:Int, col:Int, value:Int) {
        self.m = row
        self.n = col
        self.val = value
    }
}

//107 Binary Tree Level Order Traversal II
//BFS
func levelOrderBottom(root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    if root == nil {
        return result
    }
    var queue = [TreeNode?]()
    queue.append(root)
    while (!queue.isEmpty){
        var levelNodes = [Int]()
        let levelSize = queue.count
        for _ in 0 ..< levelSize {
            let node = queue.removeFirst()
            levelNodes.append((node?.val)!)
            if (node?.left != nil){
                queue.append(node?.left)
            }
            if (node?.right != nil){
                queue.append(node?.right)
            }
        }
        result.insert(levelNodes, atIndex: 0)
    }
    return result
}

////107 DFS solution TODO
//func levelOrderBottomDFS(root: TreeNode?) -> [[Int]] {
//    var result = [[Int]]()
//    if root == nil {
//        return result
//    }
//
//    return result
//}
//helper for 107 TODO
func levelOrderDFS(root: TreeNode?, result: [[Int]], level: Int) {
    
}

// 79 word search
func exist(board: [[Character]], _ word: String) -> Bool {
    let target = Array(word.characters)
    if board.count * board[0].count < target.count {
        return false
    }
    var mat = board
    for i in 0 ..< board.count {
        for j in 0 ..< board[0].count {
            if board[i][j] == target[0]{
                if existDFS(&mat, target, row:i, col: j) {
                    return true
                }
            }
        }
    }
    return false
}

// helper for 79
// word search in board
func existDFS(inout board: [[Character]], _ target: [Character], row: Int, col: Int) -> Bool {
    guard (row >= 0 && row < board.count && col >= 0 && col < board[0].count) else{
        return false
    }
    if board[row][col] != target[0] {
        return false
    }
    if target.count == 1 {
        return true
    }
    let temp = board[row][col]
    board[row][col] = " "
    var word = target
    word.removeFirst()
    let result = existDFS(&board, word, row: row - 1, col: col) ||
        existDFS(&board, word, row: row, col: col - 1) ||
        existDFS(&board, word, row: row, col: col + 1) ||
        existDFS(&board, word, row: row + 1, col: col)
    board[row][col] = temp
    return result
}

func coinChange(coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else {
        return 0
    }
    var dp:[Int] = Array(count: amount + 1, repeatedValue: Int.max)
    dp[0] = 0
    for i in 1 ... amount {
        for coin in coins {
            if (i >= coin && dp[i - coin] != Int.max){
                dp[i] = min(dp[i], 1 + dp[i - coin])
            }
        }
    }
    return dp[amount] != Int.max ? dp[amount] : -1
}

func invertTree(root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    let temp = root!.left
    root!.left = invertTree(root!.right)
    root!.right = invertTree(temp)
    invertTree(root!.left)
    
    return root
}

/*
 
 Q: Given a pattern and a string str, find if str follows the same pattern.
 
 1. pattern = "abba", str = "qualtrics rocks rocks qualtrics" should return true.
 2. pattern = "baab", str = "we qualtrics qualtrics rocks" should return false.
 3. pattern = "aaaa", str = "rocks qualtrics qualtrics rocks" should return false.
 4. pattern = "abba", str = "qualtrics qualtrics qualtrics qualtrics" should return false.
 
 */

func isMatch (pattern: String, str: String) -> Bool {
    let patternArr = Array(pattern.characters)
    let strArr = str.componentsSeparatedByString(" ")
    if (patternArr.count != strArr.count) {
        return false
    }
    var dictionary = [String : Character]()
    var dictionary2 = [Character : String]()
    
    for i in 0 ..< patternArr.count {
        if dictionary[strArr[i]] != nil {
            if (patternArr[i] != dictionary[strArr[i]]) {
                return false
            }
        }
        else{
            dictionary[strArr[i]] = patternArr[i]
        }
        
        if dictionary2[patternArr[i]] != nil {
            if (strArr[i] != dictionary2[patternArr[i]]){
                return false
            }
        }
        else{
            dictionary2[patternArr[i]] = strArr[i]
        }
    }
    return true
}

func verticalOrder(root: TreeNode?) -> [[Int]]{
    var res = [[Int]]()
    if (root == nil) {
        return res
    }
    var queue = [ColomnTreeNode?]()
    var map = [Int : [Int]]()
    let node = ColomnTreeNode(root!, 0)
    queue.append(node)
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        let col = pop!.col;
        let val = pop!.node.val
        // insert pop's children
        if(pop?.node.left != nil){
            let leftColNode = ColomnTreeNode((pop?.node.left)!, (pop?.col)! - 1)
            queue.append(leftColNode)
        }
        if (pop?.node.right != nil){
            let rightColNode = ColomnTreeNode((pop?.node.right)!, pop!.col + 1)
            queue.append(rightColNode)
        }
        //put pop's value in hashmap/dictionary
        if (map[col] == nil){
            var list = [Int]()
            
            list.append(val)
            map[col] = list
        }
        else{ // append
            var list = map[col]
            list?.append(val)
            map[col] = list
        }
    }
    // populate result from hashtable
    // find the max and min value of all the keys in the hash/dict
    var max = Int.min
    var min = Int.max
    for (key, _) in map {
        if key > max {
            max = key
        }
        if(key < min){
            min = key
        }
    }
    for i in min ... max {
        res.append(map[i]!)
    }
    return res
}

//Helper func for decode ways A,B..Z is 1,2...26
func isValidCode(s: String) -> Bool{
    guard(Int(s) != nil && s[s.startIndex] != "0") else {
        return false
    }
    let num = Int(s)
    return (num >= 1 && num <= 26)
}

// decode way
func numDecodings(s: String) -> Int{
    let len = s.characters.count
    if (len == 0) {return 0}
    var dp = Array(count: len + 1, repeatedValue:0)
    dp[0] = 1
    if !isValidCode(String(s[s.startIndex])){
        return 0 // early return
    }
    else{
        dp[1] = 1;
    }
    for i in 1 ..< len {
        let sub1 = String(s[s.startIndex.advancedBy(i)])
        let sub2 = s[s.startIndex.advancedBy(i-1)...s.startIndex.advancedBy(i)]
        if !isValidCode(sub1) && !isValidCode(sub2){
            return 0 // early return
        }
        if isValidCode(sub1) {
            dp[i+1] = dp[i+1] + dp[i]
        }
        if isValidCode(sub2) {
            dp[i+1] = dp[i+1] + dp[i-1]
        }
    }
    return dp[len]
}
// one edit distance
func isOneEditDistance(s:String, _ t:String) -> Bool {
    let lens = s.characters.count
    let lent = t.characters.count
    if (lens > lent){
        return isOneEditDistance(t, s)
    }
    if (lent - lens) > 1 {
        return false
    }
    if(lens == lent){
        var count = 0
        for i in 0 ..< lens {
            if s[s.startIndex.advancedBy(i)] != t[t.startIndex.advancedBy(i)]{
                count += 1
            }
            if count > 1 {
                return false
            }
        }
        return count == 1
    }
    else{ // lens + 1 == lent
        for i in 0 ..< lens {
            if s[s.startIndex.advancedBy(i)] != t[t.startIndex.advancedBy(i)] {// encountered the first different char
                let s1 = s.substringFromIndex(s.startIndex.advancedBy(i))
                let s2 = t.substringFromIndex(t.startIndex.advancedBy(i+1))
                return s1 == s2
            }
            return true
        }
    }
    return false;
}

func sumNumbers(root: TreeNode?) -> Int {
    var sum = 0; // swift does not modification of parameters unless using inout.
                // but inout cannot be applied to a constant number. So has to declare a var sum
    return helperSum(root, &sum);
}
func helperSum(node: TreeNode?, inout _ sum: Int) -> Int{
    if(node == nil) {
        return 0;
    }
    sum = sum * 10 + node!.val;
    if (node!.left == nil && node!.right == nil){
        return sum;
    }
    return helperSum(node!.left, &sum) + helperSum(node!.right, &sum);
}
//multiply two big numbers
func multiply(num1: String, _ num2: String) -> String {
    let count1 = num1.characters.count
    let count2 = num2.characters.count
    
    var result = ""
    let len = count1 + count2
    var pos = Array(count:len, repeatedValue:0)
    var nums1 = Array(count: count1, repeatedValue:0)
    var nums2 = Array(count: count2, repeatedValue:0)
    for i in 0 ..< count1 {
        // the following convert char at to String, then to Int. need unwrap optional
        nums1[i] = Int(String(num1[num1.startIndex.advancedBy(i)]))!
        //the following convert substring of length 1 to Int. need unwrap optional too
        //        let range = num1.startIndex.advancedBy(i) ..< num1.startIndex.advancedBy(i+1)
        //        nums1[i] = Int(num1[range])!
        
    }
    for i in 0 ..< count2 {
        nums2[i] = Int(String(num2[num2.startIndex.advancedBy(i)]))!
    }
    for i in (0 ..< count1).reverse() {
        for j in (0 ..< count2).reverse() {
            let multi = nums1[i] * nums2[j]
            pos[i+j+1] += multi
        }
    }
    // do carry
    for i in (1 ..< len).reverse() {
        pos[i-1] += pos[i] / 10
        pos[i] = pos[i] % 10
    }
    for i in 0 ..< len {
        print(pos[i])
    }

    // convert each element to String and append to solution
    // skip the first few "0" paddings in the front
    var start = 0
    while (start < len && pos[start] == 0){
        start += 1
    }
    if (start == len){
        return "0"
    }
    for i in start ..< len {
        print(result)
        result += String(pos[i])
    }
    return result
}

//find cycle in di-graph, course schedule 1 leet 207
func canFinish(numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    //build up garph. Each course is a key in the graph dictionary
    var graph = [Int:Set<Int>]()
    for i in 0 ..< numCourses {
        graph[i] = Set<Int>()
    }
    //adding graph dependency
    for i in 0 ..< prerequisites.count{
        graph[prerequisites[i][0]]!.insert(prerequisites[i][1])
    }
    //for each class, if it has cycle, return false
    var visited = Array(count: numCourses, repeatedValue:0)
    for i in 0 ..<  prerequisites.count {
        if hasCycle(prerequisites[i][1], graph, &visited) {
            return false
        }
    }
    return true
}
func hasCycle(key: Int, _ graph: [Int:Set<Int>], inout _ visited:[Int]) -> Bool {
    if visited[key] == 1 { //visited previously, and encountered again during dfs, so it's a cycle
        return true
    }
    if visited[key] == 2 { //finished all DFS and come to itself, so it's good.
        return false
    }
    visited[key] = 1 // this is the starting vertex being visited
    
    // for each element in the value set (the depedencies of the course) of the key(the course number)
    for item in graph[key]!{
        if hasCycle(item, graph, &visited){
            return true
        }
    }
    visited[key] = 2 //after all the DFS and it has no cycle, mark it as 2, indicating a no-cycle visited
    return false
}

//course schedule 2. leet 210, using DFS
func findOrder(numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var res = [Int]() // result
    // this time using 2d array to build graph
    var graph = [[Int]](count: numCourses, repeatedValue:[Int]())
    //add dependency to the graph
    for i in 0 ..< prerequisites.count {
        graph[prerequisites[i][0]].append(prerequisites[i][1])
    }
    var visited = [Int](count: numCourses, repeatedValue: 0)//0-visited, 1-visiting, 2-visited
    for i in 0 ..< numCourses {
        if topoDFS(i,graph, &visited, &res) == false {//i.e. found cycle
            return [Int]()//空的结果
        }
        //the dfs with continue and fill the res with right order
    }
    return res
}

/* if the graph has cycle, return false, else return true.
 DFS topological sort
 */
func topoDFS(key: Int, _ graph:[[Int]], inout _ visited:[Int], inout _ res:[Int] ) ->Bool{
    if visited[key] == 1 {
        return false // find cycle
    }
    if visited[key] == 2{
        return true // no cycle, and is done with this node
    }
    //set visited from 0 to 1
    visited[key] = 1
    // for all it's edges do dfs
    if(graph[key].count > 0){
        for item in graph[key]{
            if topoDFS(item, graph, &visited, &res) == false{
                return false
            }
        }
    }
    // after done with all dfs, append the current key to result
    visited[key] = 2
    res.append(key)
    return true
}

//course schedule 2. leet 210, using BFS
//1. put all courses that no body depends on it into queue, add to the head of result(or reverse in the end)
//2. pop the queue, and add courses that are depended on it into queue. Map[key] is course(child)
//    map[value] is a list of courses that it depends on(parent)

func findOrderBFS(numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var res = [Int]()
    // build graph
    //add dependency & get which elements not haing dependency, i.e. can start first
    var graph = [Int:[Int]]() // cannot use set as value, as it will break indegree's logic
    for i in 0 ..< numCourses {
        graph[i] = [Int]()
    }
    // indegree recordes how many courses depend on it
    var indegree = [Int](count: numCourses, repeatedValue:0)
    for i in 0 ..< prerequisites.count {
        graph[prerequisites[i][0]]?.append(prerequisites[i][1])
        indegree[prerequisites[i][1]] += 1
    }
    print(indegree)
    // put all courses that do not depend on other cource into Queue. Also put them in res
    var queue = [Int]()
    for i in 0 ..< numCourses{
        if indegree[i] == 0 {
            queue.append(i)
            res.insert(i, atIndex: 0)
        }
    }
    var count = numCourses
    while queue.count > 0 {
        let cur = queue.removeFirst()
        for item in graph[cur]!{
            indegree[item] -= 1
            if(indegree[item] == 0) {
                queue.append(item)
                res.insert(item, atIndex: 0)
            }
        }
        count -= 1
    }
    if(count != 0) {// circle, count < 0
        return [Int]()
    }
    return res
}
