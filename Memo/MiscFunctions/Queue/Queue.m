//
//  Queue.m
//  Memo
//
//  Created by Cindy Bi on 10/27/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import "Queue.h"

@implementation Queue


-(void)enqueue:(id) obj{
    [self.queueContainer insertObject:obj atIndex:0];
}
-(id)dequeue{
    id obj = [self.queueContainer firstObject];
    return obj;
    
}
-(bool)isEmpty{
    return [self.queueContainer count] == 0;
}
-(NSUInteger)size{
    return [self.queueContainer count];
}
@end
