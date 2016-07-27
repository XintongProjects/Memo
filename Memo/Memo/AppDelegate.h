//
//  AppDelegate.h
//  Memo
//
//  Created by Cindy on 6/8/15.
//  Copyright (c) 2015 XintongBi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void) testOfString;
-(void) testOfLinkedList;
-(int *) productWithoutSelf: (int*) arr forlength:(int) len andReturnLength:(int *)returnLength;
//-(NSArray*) productWithoutSelf: (NSArray*)arr;
-(void) runtests;

@end

