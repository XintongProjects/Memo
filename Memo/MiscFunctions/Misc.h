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


@interface Misc : NSObject{
}

- (BOOL) isHappyNumber:(int)number;

-(NSMutableArray *)printSpiral:(int**) matrix withRow :(int)row andCol:(int) col;

//-(NSString *) reverseString: (NSString*) s;

- (void) reverseString: (char *)str start: (int) low end:(int)hi;
- (void) reverseWords: (char *) words;

- (void) findAllPairs;
- (void) randomNumbers;

@end



