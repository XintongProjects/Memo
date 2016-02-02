//
//  Misc.h
//  Memo
//
//  Created by Cindy Bi on 7/17/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

//#ifndef Misc_h
//#define Misc_h
//
//
//#endif /* Misc_h */
#import "GraphNode.h"

@interface Misc : NSObject{
}

- (BOOL)isHappyNumber:(int)number;

- (NSMutableArray *)printSpiral:(int**) matrix withRow:(int)row andCol:(int) col;

//-(NSString *) reverseString: (NSString*) s;

- (void)reverseString: (char *)str start: (int)low end:(int)hi;
- (void)reverseWords: (char *) words;

- (void)findAllPairs;
- (void)randomNumbers;
- (BOOL)isFuzzyMatch:(NSString *)input filterWith: (NSString *) filter;
- (BOOL)isMatchingWords: (NSString *)input mapWith: (NSString *)mapping;
- (void)createGraph;
- (GraphNode*)cloneGraph:(GraphNode*) root;
- (GraphNode *)cloneGraphHelper:(GraphNode *)root withMapping: (NSMutableDictionary *)dict;
// remove duplicated strings in an array of strings
- (NSMutableArray *)removeDuplicates:(NSArray*)inputArr;
- (NSMutableArray *)randomization:(NSMutableArray*)inputArr;
@end



