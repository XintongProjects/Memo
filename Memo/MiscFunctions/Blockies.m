//
//  Blockies.m
//  Memo
//
//  Created by Cindy Bi on 7/31/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import "Blockies.h"

@implementation Blockies


-(void) blockTests{
    
    
    NSInteger localCounter = 42;
    __block char localCharacter;
    
    void (^aBlock)(void) = ^(void) {

        NSInteger counterGlobal = localCounter; // localCounter fixed at block creation
        localCharacter = 'a'; // sets localCharacter in enclosing scope
        NSLog(@"counterGlobal is: %ld", (long)counterGlobal);
    };
    
    ++localCounter; // unseen by the block
    localCharacter = 'b';
    
    aBlock(); // execute the block
    // localCharacter now 'a'
    
    NSLog(@"localCharacter is: %c", localCharacter);
    
}
@end
