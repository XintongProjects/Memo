//
//  NSArray+Shuffle.m
//  Memo
//
//  Created by Cindy Bi on 2/2/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)

// A method to remove duplicates in an input array.
- (NSArray *)cbi_removeDuplicates:(NSArray*)inputArr{
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:inputArr];
    NSArray *result = [orderedSet array];
    //NSMutableArray *result = [array mutableCopy];
    return result;
}

// A method to shuffle an array. i.e. to generate random permutation of an array
// of objects
// It utilizes  Fisher–Yates shuffle algorithm which has low standard deviation.
// Test: Would need to run thousands time to test the number of occurance of each
// permutation. If the deviation is less than 2% it would be probobly OK.
// Fisher–Yates algorithm boasts lower than 0.2% of standard deviation.
- (NSArray *)cbi_shuffleArray:(NSArray*)inputArr{
    NSArray *cleanedArr = [self cbi_removeDuplicates:inputArr];
    NSUInteger count = [cleanedArr count];
    NSMutableArray* tempArr = [cleanedArr mutableCopy];
    if (count <= 1) {
        return cleanedArr;
    }
    else{
        // keeps inputArr the same for next run by performing permutation on it's copy.
        // this will help on unbiased testing.
        for (NSUInteger i = count - 1; i > 0; i--) {
            NSInteger swapIndex = arc4random_uniform((u_int32_t )(i + 1));
            [tempArr exchangeObjectAtIndex:i withObjectAtIndex:swapIndex];
        }
    }
    return [tempArr copy];
}
@end
