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
- (int)perfectSquares: (int) num;
- (BOOL)isFuzzyMatch:(NSString *)input filterWith: (NSString *) filter;
- (BOOL)isMatchingWords: (NSString *)input mapWith: (NSString *)mapping;
- (void)createGraph;
- (GraphNode*)cloneGraph:(GraphNode*) root;
- (GraphNode *)cloneGraphHelper:(GraphNode *)root withMapping: (NSMutableDictionary *)dict;
- (NSArray *)removeDuplicates:(NSArray*)inputArr;
-(NSArray *)shuffleArray:(NSArray*)inputArr;
-(NSArray *)permute: (NSString *)input;
-(void) recPermute:(NSMutableArray* )result sofar: (NSMutableString*) sofar andRemaining: (NSMutableString*) remain;
-(int)factorial: (int) input;
-(NSString*) sortStringByChar: (NSString*) str;
-(NSString*) sortStringByChar2: (NSString*) str;
-(NSArray*) groupAll: (NSArray *) stringArr;
-(NSString *) reverseNSWords: (NSString *) input;
-(void) experiments;
@end



