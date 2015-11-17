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
        self.stackContainer = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)push:(id)object{
    [self.stackContainer addObject:object];
}
-(id)pop{
    id obj = [self.stackContainer lastObject];
    [self.stackContainer removeLastObject];
    return obj;
}
-(id)peek{
    return [[self.stackContainer lastObject] copy];
}
-(BOOL) isEmpty{
    if([self.stackContainer count] == 0)
        return YES;
    return NO;
}
- (NSUInteger)size{
    return [self.stackContainer count];
}


@end
