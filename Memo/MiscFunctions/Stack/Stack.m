//
//  Stack.m
//  Memo
//
//  Created by Cindy Bi on 8/11/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import "Stack.h"

@implementation Stack

-(id)init{
    self = [super init];
    if(self != nil){
        stack = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)push:(id)object{
    [stack addObject:object];
}
-(id)pop{
    id obj = [stack lastObject];
    [stack removeLastObject];
    return obj;
}
-(id)peek{
    return [[stack lastObject] copy];
}
-(BOOL) isEmpty{
    if([stack count] == 0)
        return YES;
    return NO;
}
- (NSUInteger)size{
    return [stack count];
}


@end
