//
//  LLNode.h
//  Mixture
//
//  Created by Cindy Bi on 7/14/15.
//  Copyright © 2015 Xintong Bi. All rights reserved.
//


#import <Foundation/Foundation.h>
@interface LLNode : NSObject{
}



@property (strong, nonatomic) LLNode *next;
@property (assign, nonatomic) NSInteger val;

- (void) printNodes:(LLNode*)head;
//-(id) initWithValue: (NSInteger) value;
@end
