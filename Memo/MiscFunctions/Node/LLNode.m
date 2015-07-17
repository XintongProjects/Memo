//
//  LLNode.m
//  Mixture
//
//  Created by Cindy Bi on 7/14/15.
//  Copyright © 2015 Xintong Bi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLNode.h"

@implementation LLNode: NSObject

-(id) init{
    self = [super init];
    // do more initialization work if neede
    if(self){
        
    }

    return self;
}

- (void) printNodes:(LLNode*)head{
    LLNode* current = head;
    while (current){
        NSLog(@"%i", (int)current.val);
        current = current.next;
    }
}
@end