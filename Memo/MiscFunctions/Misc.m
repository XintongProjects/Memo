//
//  Misc.m
//  Memo
//
//  Created by Cindy Bi on 7/17/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Misc.h"
#import "Pair.h"
#import "GraphNode.h"

// a number can be end up with 1. For example, 12 = 1 + 4  = 25 = 2 + 25 = 27 = 4+49 = 54 = 25+16 = 41 =
// 17 = 50 = 25 // not happy, because it repeated 25, so it will infinite loop
@implementation Misc: NSObject

- (BOOL) isHappyNumber:(int)number{
    
     return YES;
    
}

//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//-(void) printSpiral:(int**) matrix row: (int) row col: (int) col{
- (NSMutableArray *)printSpiral:(int**) matrix withRow :(int)row andCol:(int) col{
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    int rowStart = 0, rowEnd = row - 1;
    int colStart = 0, colEnd = col - 1;
    //int mi[row][col];
    
    
    while (rowStart <= rowEnd && colStart <= colEnd){
        
        for (int i = colStart; i < colEnd; i++)
            [array addObject:@(matrix[rowStart][i])];
        for (int i = rowStart; i < rowEnd; i++){
            [array addObject:@(matrix[i][colEnd])];
        }
        for (int i = colEnd; i > rowStart; i--){
            [array addObject:@(matrix[rowEnd][i])];
        }
        for (int i = rowEnd; i > rowStart; i--){
            [array addObject:@(matrix[i][colStart])];
        }
        
        rowStart++;
        rowEnd--;
        colStart++;
        colEnd--;
    }
    
    return array;
}

- (void) reverseString: (char*)str start: (int) low end:(int)hi{
    if(!str) return;
    while( low < hi){
        char temp = str[low];
        str[low] = str[hi];
        str[hi] = temp;
        low++;
        hi--;
    }
}

- (void) reverseWords: (char *) words{
    int len = (int)strlen(words);
    [self reverseString:words start:0 end:len-1];
    int lo = 0, hi = 0;
    while(words[hi]){
        while (words[hi] && words[hi] != ' ') {
            hi++;
        }
        [self reverseString:words start:lo end:hi - 1];
        lo = hi+1;
        hi = lo;
    }
}

- (NSMutableArray*) findPairsInArray:(int*) arr addsUpTo: (int) target{
    NSMutableArray * results = [[NSMutableArray alloc] init];
    
    
    return results;
}

- (void) randomNumbers{
    int len = 10;
    // generate a random number between 0 and len
    NSMutableArray* arrNumbers = [NSMutableArray arrayWithCapacity:len];
    for (int i = 0; i < len; i++){
        [arrNumbers addObject:[NSNumber numberWithInt:i]];
    }
    //shuffle the elements
    for (int i = 0; i < len; i++){
        int r = arc4random_uniform(len);
        NSNumber* temp = arrNumbers[i];
        arrNumbers[i] = arrNumbers[r];
        arrNumbers[r] = temp;
    }
    
    // add len2 more elements, and need be randomized, such that each element is different form it's previous one.
    
    int len2 = 20;
    for (int i = 0; i < len2; i++){
        int r = arc4random_uniform(len);
        
        while([arrNumbers[r] isEqualToNumber: arrNumbers[len - 1 + i]]){ // here is the same result as "=="
            r = arc4random_uniform(len);
            //r = rand()%len;
        }
        [arrNumbers addObject:arrNumbers[r]];
    }
    for (int i = 0; i < (len + len2); i++){
        ;//NSLog(@"arrNumber[%d] is %@", i, arrNumbers[i]);
    }
    
    int haha[] = {'a', 'b', '\0'};
    printf("haha***%s\n",(char *)haha);
    
}

- (int) perfectSquares: (int) num;{
    if (num <= 0) return 0;
    int dp[num + 1];
    //init all elem
    for (int i = 0; i <= num; i++){
        dp[i] = i;
    }
    //pre-fill perfect sqrs
    for (int i = 0; i * i <= num; i++){
        dp[i * i] = 1;
    }
    //real fun
    for (int i = 2; i <= num; i++){
        for(int j = 2; j * j < i; j++){
            dp[i] = MIN(dp[i], dp[i - j*j] + 1);
        }
        //NSLog(@"perfect sqrs count for %d: %d", i, dp[i]);
    }
    
    return dp[num];
}
// find all pairs in an input int array that adds up to a target value
- (void)findAllPairs{
//    @interface Pair : NSObject{
//    }
//    @property (nonatomic, assign) int a;
//    @property (nonatomic, assign) int b;
//    - (NSString *)description;
//    @end
    NSMutableArray * results = [[NSMutableArray alloc] init];
    int input[14] = {10, 10, 3, 8, 7, 50, 0, 9, 8, 1, 12, -1, -2, 0};
    int len = 14;
    int sum = 10;
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < len; i++){
        int goal = sum - input[i];
        //found matching
        if(dict[[NSNumber numberWithInt:goal]]){
            Pair *p = [Pair new];//[[Pair alloc]init];
            p.a = input[i];
            p.b = goal;
            [results addObject: p];
            int val = [dict[[NSNumber numberWithInt:goal]] intValue];
            val--;
            if (val == 0)
                [dict removeObjectForKey:[NSNumber numberWithInt:goal]];
            else{
                dict[[NSNumber numberWithInt:goal]] = [NSNumber numberWithInt:val];
            }
        }
        else{
        if(![dict objectForKey:[NSNumber numberWithInt:input[i]]]){
            dict[[NSNumber numberWithInt:input[i]]] = [NSNumber numberWithInt:1];
        }
            else{
                int value = [dict[[NSNumber numberWithInt:input[i]]] intValue];
                value++;
                dict[[NSNumber numberWithInt:input[i]]] = [NSNumber numberWithInt:value];
            }
        }
    }
    for (int i = 0; i < [results count]; i++){
        NSLog(@"Results[%d]:%@", i, results[i]);
    }
}

// Filer string must be in the same grouping and order of the input
- (BOOL)isFuzzyMatch: (NSString *)input filterWith: (NSString *) filter{
    
    
    return NO;
}

// "abcdef" and "be" are matching
// "abcdef" and "abcdgf" are not matching
- (BOOL)isMatchingWords: (NSString *)input mapWith: (NSString *)mapping{
//    
//    NSString *hay = @"hello bla bla yadi yadi needle yadi";
//    if ([hay rangeOfString:@"needle"].location == NSNotFound) {
//        NSLog(@"hay does not contain needle");
//    } else {
//        NSLog(@"hay contains needle!");
//    }

    
    NSString *numbers = @"1234567890";
    NSLog(@"%@",[numbers substringFromIndex:4]); //567890
    NSLog(@"%@",[numbers substringToIndex:6]); //123456
    NSLog(@"%@",[numbers substringWithRange:NSMakeRange(3, 5)]); //45678
    
    int inputLen = (int)input.length;
    int mappingLen = (int)mapping.length;
    int mappingCurrent = 0;
    int inputCurrent = 0;
    while (mappingCurrent < mappingLen && inputCurrent < inputLen) {
        if([mapping characterAtIndex:mappingCurrent] == [input characterAtIndex:inputCurrent]){
            mappingCurrent++;
        }
        inputCurrent++;
    }
    if (mappingCurrent == mappingLen) {
        return YES;
    }
    return NO;
}

// has 0 sum or not? consecutive
- (BOOL) hasZeroSum: (int *) input withLength: (int) length{
    NSMutableSet * set = [NSMutableSet new];
    int sum = 0;
    [set addObject:[NSNumber numberWithInt:sum]];
    for (int i = 0; i < length; i++){
        sum += input[i];
        if([set containsObject:[NSNumber numberWithInt:sum]]){
            return YES;
        }
        else{
            [set addObject:[NSNumber numberWithInt:sum]];
        }
    }    
    return NO;
}

- (void)createGraph{
    GraphNode *node1 = [[GraphNode alloc] initWithValue:1];
    GraphNode *node2 = [[GraphNode alloc] initWithValue:2];
    GraphNode *node3 = [[GraphNode alloc] initWithValue:3];
    GraphNode *node4 = [[GraphNode alloc] initWithValue:4];
    NSArray *neighborsOf1 = [NSArray arrayWithObjects:node1, node2, node3, node4, nil];
    NSArray *neighborsOf2 = [NSArray arrayWithObjects:node1, nil];
    NSArray *neighborsOf3 = [NSArray arrayWithObjects:node4, node1, nil];
    NSArray *neighborsOf4 = [NSArray arrayWithObjects: node1, nil];
    node1.neighbors = neighborsOf1;
    node2.neighbors = neighborsOf2;
    node3.neighbors = neighborsOf3;
    node4.neighbors = neighborsOf4;

    GraphNode *cloneOfGraphFromNode1 = [self cloneGraph:node1];
    for (GraphNode *item in cloneOfGraphFromNode1.neighbors) {
        NSLog(@"Neighber is %d", item.val);
    }
}
- (GraphNode *)cloneGraph:(GraphNode*) root{

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    return [self cloneGraphHelper:root withMapping: dict];
    
}

- (GraphNode *)cloneGraphHelper:(GraphNode *)root withMapping: (NSMutableDictionary *)dict{
    //NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:oldArray]];
    
    if (!root) {
        return nil;
    }
    GraphNode *rootCP = rootCP = [[GraphNode alloc] initWithValue:root.val];
    dict[root] = rootCP;
    
    NSMutableArray *neighborsMu = [NSMutableArray new];
    for (GraphNode* item in root.neighbors){
        //if map contains the item's copy, just append the copy to neighborsMU, otherwise, create a copy of it, put in table, and append to neighborsMU
        if (!dict[item]) {
            dict[item] = [self cloneGraphHelper:item withMapping:dict];
        }
        [neighborsMu addObject:dict[item]];
    }
    rootCP.neighbors = [neighborsMu copy];
    return  rootCP;
}

// A method to remove duplicates in an input array.
- (NSArray *)removeDuplicates:(NSArray*)inputArr{
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:inputArr];
    NSArray *result = [orderedSet array];

    //NSMutableArray *result = [array mutableCopy];
    return result;
}

// A method to shuffle an array. i.e. to generate random permutation of an array items
// It utilizes  Fisher–Yates shuffle algorithm which has low standard deviation.
- (NSArray *)shuffleArray:(NSArray*)inputArr{
    NSArray *cleanedArr = [self removeDuplicates:inputArr];
    NSUInteger count = [cleanedArr count];
    NSMutableArray* tempArr = [cleanedArr mutableCopy];
    if (count <= 1) {
        return cleanedArr;
    }
    else{
        // keeps inputArr the same for next run by performing permutation on it's copy.
        for (NSUInteger i = count - 1; i > 0; i--) {
            NSInteger swapIndex = arc4random_uniform((u_int32_t )(i + 1));
            [tempArr exchangeObjectAtIndex:i withObjectAtIndex:swapIndex];
        }
    }
    return [tempArr copy];
}

// the following recPermute recusion. Note because obj-c string is pass by reference, so new string is needed each time.
-(void) recPermute:(NSMutableArray* )result sofar: (NSMutableString*) sofar andRemaining: (NSMutableString*) remain{
    if([remain isEqualToString:@""]){
        [result addObject:sofar];
    }
    else{
        for (int i = 0; i < remain.length; i++){
            NSString* s = [NSString stringWithFormat:@"%c",[remain characterAtIndex:i ]];
            NSMutableString *newSofar =[sofar mutableCopy];
            [newSofar appendString:s];
            NSLog(@"sofar is:%@", sofar);
            NSMutableString* newRemain = [remain mutableCopy];
            [newRemain deleteCharactersInRange:NSMakeRange(i, 1)] ;
            [self recPermute:result sofar:newSofar andRemaining:newRemain];
        }
    }
}

-(NSArray *) permute:(NSString *)input{
    NSMutableArray *result = [NSMutableArray new];
    [self recPermute:result sofar:[@"" mutableCopy] andRemaining:[input mutableCopy]];
    for (int i = 0; i < result.count; i++){
        NSLog(@"result array is %@", result[i]);
    }
    return [result copy];
}

// the following recursion works great
-(int)factorial: (int) input{
    if (input == 1) return 1;
    else{
        return input * [self factorial:input - 1];
    }
}

-(NSString*) sortStringByChar: (NSString*) str {
    NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:str.length];
    for (int i=0; i< str.length; ++i) {
        NSString *charStr = [str substringWithRange:NSMakeRange(i, 1)];
        [charArray addObject:charStr];
    }
    [charArray sortUsingComparator:^(NSString *a, NSString *b){
        return [a compare:b];
    }];
    NSLog(@"charArray is %@", charArray);
    NSString* result = [charArray componentsJoinedByString:@""];
    NSLog(@"result string is %@", result);
    return result;
}

-(NSArray *) convertStringToArray:(NSString *) str{
    NSArray* result = [NSArray new];
    for (int i = 0; i < str.length; i++){
        [result arrayByAddingObject:[NSString stringWithFormat:@"%c", [str characterAtIndex:i]]];
    }
    return result;
}

-(NSArray*) sortArray: (NSArray*) arr{
    
    return [arr sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}
-(NSString*) convertArrayToString: (NSArray*)arr{
    NSString *combinedStr = [arr componentsJoinedByString:@""];
    return combinedStr;
}

-(NSString*) sortStringByChar2: (NSString*) str{
    
    NSArray* charArr = [self convertStringToArray:str];
    NSArray* sortedChar = [self sortArray:charArr];
    return [self convertArrayToString:sortedChar];
}

// group all anagrams in input array of strings
-(NSArray*) groupAll: (NSArray *) stringArr{
    NSMutableArray* list = [NSMutableArray new];
    NSMutableDictionary* dict = [NSMutableDictionary new];
    
    int len = (int)[stringArr count];
    if (len == 0) return [list copy];
    for (int i = 0; i < len; i++){
        NSString*key = [self sortStringByChar2:stringArr[i]];
        if(![[dict allKeys] containsObject:key]){
            NSMutableArray* group = [NSMutableArray arrayWithObject:stringArr[i]];
            dict[key] = group;
        }
        else{
            NSMutableArray* group = dict[key];
            [group addObject:stringArr[i]];
            dict[key] = group;
        }
    }
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [list addObject:obj];
    }];
    
    return [list copy];
}

@end