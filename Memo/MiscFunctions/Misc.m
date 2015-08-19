//
//  Misc.m
//  Memo
//
//  Created by Cindy Bi on 7/17/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Misc.h"

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

@end