//
//  XBAutoreleasepool.h
//  Memo
//
//  Created by Cindy Bi on 2/23/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBAutoreleasepool : NSObject{
    CFMutableArrayRef _objects;
}
+ (void)addObject: (id)object;

- (void)addObject: (id)object;


@end
