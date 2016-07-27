//
//  Stack.h
//  Memo
//
//  Created by Cindy Bi on 8/11/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject{
    //NSMutableArray *stack;
}
@property (strong, nonatomic) NSMutableArray *stackContainer;

-(void)push:(id)object;
-(id)pop;
-(id)peek;
-(BOOL) isEmpty;
- (NSUInteger)size;

@end
