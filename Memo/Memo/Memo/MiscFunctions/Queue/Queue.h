//
//  Queue.h
//  Memo
//
//  Created by Cindy Bi on 10/27/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject{
}
@property (strong, nonatomic) NSMutableArray *queueContainer;
- (void)enqueue:(id) obj;
- (id)dequeue;
- (BOOL)isEmpty;
- (NSUInteger) size;

@end
