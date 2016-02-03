//
//  NSArray+Shuffle.h
//  Memo
//
//  Created by Cindy Bi on 2/2/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Shuffle)
// The following methods use "cbi_" as prefix to avoid namespace conflicts
- (NSArray *)cbi_removeDuplicates:(NSArray*)inputArr;
- (NSArray *)cbi_shuffleArray:(NSArray*)inputArr;

@end
