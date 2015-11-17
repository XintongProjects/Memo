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
    
    
    __block NSInteger localCounter = 42;
    __block char localCharacter;
    
    void (^aBlock)(void) = ^(void) {
        localCounter = 50;
        NSInteger counterGlobal = localCounter; // localCounter fixed at block creation
        localCharacter = 'a'; // sets localCharacter in enclosing scope
        NSLog(@"counterGlobal is: %ld", (long)counterGlobal);
    };
    
    localCounter += 10; // unseen by the block
    localCharacter = 'b';
    
    aBlock(); // execute the block
    // localCharacter now 'a'
    NSLog(@"localcounter is %ld", (long)localCounter);
    NSLog(@"localCharacter is: %c", localCharacter);
    
    
    NSInteger (^alwaysReturnNSIntegerZero)() = ^ NSInteger (){ return 0; };
    long long (^alwaysReturnLongLongZero)() = (long long (^)())alwaysReturnNSIntegerZero;
    
    NSString * s = @"hello";
    BOOL isString = [s isKindOfClass:[NSString class]];
    NSLog(isString?@"Yes":@"No");
    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *rsp, NSData *d, NSError *e) {
//        // process request here
//    }];
//    
//    
//    [NSURLConnection sendAsynchronousRequest: request queue:[NSOperationQueue mainQueue] completionHandler:<#^(NSURLResponse * __nullable response, NSData * __nullable data, NSError * __nullable connectionError)handler#>){
//        
//    }];
    
}
@end
