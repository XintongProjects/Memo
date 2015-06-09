//
//  AppDelegate.m
//  Memo
//
//  Created by Cindy on 6/8/15.
//  Copyright (c) 2015 XintongBi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString* str = @"Hello world KAYAK";
    NSLog(@"str[1] is %c",[str characterAtIndex: 1]);
    NSString *subString = [str substringWithRange:NSMakeRange(0, 8)];
    NSLog(@"sbustring is %@", subString);
    NSString *sub2 = [str substringFromIndex:1];
    NSString *sub3 = [str substringToIndex:14];
    
    
    //from NSString to NSmutableString
    NSMutableString* comb = [subString mutableCopy];
    char c = [str characterAtIndex:12];
    [comb appendFormat:@"%c", c];
    
    
     NSLog(@"sbu2 is: %@**sub3 is %@**comb is %@", sub2, sub3, comb);
    
    NSMutableDictionary* dict = [NSMutableDictionary alloc];
    NSArray *strArr = @[@"hello", @"world", @"blah", @"car", @"rac"];
    unsigned long len = [strArr count];
    NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity:len];
    
    
    if(![[dict allKeys] containsObject:@"car"]){
        [values addObject:@5];
        [dict setObject:values forKey:@"car"];
    }
    else{
        //add index to the corresponding mutable arr values
    }
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
