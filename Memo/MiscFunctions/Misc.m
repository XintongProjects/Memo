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

@implementation Misc: NSObject


- (BOOL) isHappyNumber:(int)number{
     return YES;
    
}

//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//-(void) printSpiral:(int**) matrix row: (int) row col: (int) col{
-(NSMutableArray *)printSpiral:(int**) matrix withRow :(int)row andCol:(int) col{
    
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
        NSLog(@"arrNumber[%d] is %@", i, arrNumbers[i]);
    }
    
    
}
// find all pairs in an input int array that adds up to a target value
- (void) findAllPairs{
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

@end