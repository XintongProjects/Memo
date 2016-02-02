//
//  GraphNode.m
//  Memo
//
//  Created by Cindy Bi on 11/24/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import "GraphNode.h"

@implementation GraphNode

- (instancetype)initWithValue: (int) value{
    self = [super init];
    if(self) {
        self.val = value;
    }
    return self;
}

- (void)addNeighbor:(GraphNode*) newNode{
    NSMutableArray *muNeighbors = [self.neighbors mutableCopy];//[NSMutableArray arrayWithArray:self.neighbors];
    if([newNode conformsToProtocol:@protocol(NSCopying)]){
        [muNeighbors addObject:newNode];
    }
    else{
        [muNeighbors addObject:[newNode copy]];
    }
    self.neighbors = [muNeighbors copy];
}

//- (id)copyWithZone:(NSZone *)zone {
//    Crime *newCrime = [super copyWithZone:zone];
//    newCrime->_month = [_month copyWithZone:zone];
//    newCrime->_category = [_category copyWithZone:zone];
//    // etc...
//    return newCrime;
//}


//- (id)copyWithZone:(NSZone *)zone
//{
//    id copy = [[[self class] alloc] init];
//    
//    if (copy)
//    {
//        // Copy NSObject subclasses
//        [copy setVendorID:[[self.vendorID copyWithZone:zone] autorelease]];
//        [copy setAvailableCars:[[self.availableCars copyWithZone:zone] autorelease]];
//        
//        // Set primitives
//        [copy setAtAirport:self.atAirport];
//    }
//    
//    return copy;
//}

- (id)copyWithZone:(NSZone *)zone {
    
    return self;
}


@end
