//
//  GraphNode.h
//  Memo
//
//  Created by Cindy Bi on 11/24/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphNode : NSObject <NSCopying>
@property (assign, nonatomic) int val;
@property (strong, nonatomic) NSArray* neighbors;

- (void)addNeighbor:(GraphNode*)newNode;
- (instancetype)initWithValue:(int)value;
//- (id)copyWithZone:(NSZone *)zone;
@end
