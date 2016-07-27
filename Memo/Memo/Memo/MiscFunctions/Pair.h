//
//  Pair.h
//  Memo
//
//  Created by Cindy Bi on 11/3/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pair : NSObject{
}
@property (nonatomic, assign) int a;
@property (nonatomic, assign) int b;
//@property (nonatomic, assign) Pair* p;
//@property (nonatomic, weak) Pair* pweak;

- (NSString *)description;
@end
