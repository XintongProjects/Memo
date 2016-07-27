//
//  Pair.m
//  Memo
//
//  Created by Cindy Bi on 11/3/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import "Pair.h"

@implementation Pair
- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"a:%d; b:%d;", self.a, self.b];
    return descriptionString;    
}

@end
