//
//  NSObject+XBAutoreleasepool.m
//  Memo
//
//  Created by Cindy Bi on 2/23/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

#import "NSObject+XBAutoreleasepool.h"
#import "XBAutoreleasepool.h"

@implementation NSObject (XBAutoreleasepool)
- (id)xb_autorelease{
    [XBAutoreleasepool addObject:self];
    return self;
}
@end
