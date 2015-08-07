//
//  AppDelegate.m
//  Memo
//
//  Created by Cindy on 6/8/15.
//  Copyright (c) 2015 XintongBi. All rights reserved.
//

#import "AppDelegate.h"
#import "LLNode.h"
#import "Blockies.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self runtests];
    // Override point for customization after application launch.
    return YES;
}

-(void) runtests{
    [self testOfLinkedList];
    [self testOfString];
    [self stringTests];
    [self blocksTests];
    
    NSString * key1 = @"key1";
    NSLog(@"key1[0] is %c", [key1 characterAtIndex:0]);
    
    NSString *key2 = @"key2";
    NSNumber *val1 = [NSNumber numberWithInt: 1];
    NSNumber *val2 = [NSNumber numberWithInt: 2];
    //NSMapTable * map = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableWeakMemory];
    
    NSMapTable * mapTable = [[NSMapTable alloc] init];
    [mapTable setObject:val1 forKey:key1];
    [mapTable setObject:val2 forKey:key2];
    NSLog(@"mapTable is %@", mapTable);
    //NSLog(@"removing key2");
    
    
    //NSLog(@"mapTable is %@", mapTable);
    
}
-(void) testOfString{
    
    NSString* str = @"Hello world KAYAK";
    NSLog(@"str[1] is %c",[str characterAtIndex: 1]); //'e'
    NSString *subString = [str substringWithRange:NSMakeRange(0, 8)];
    NSLog(@"sbustring is %@", subString);
    NSString *sub2 = [str substringFromIndex:1];
    NSString *sub3 = [str substringToIndex:14];
    
    
    //from NSString to NSmutableString
    NSMutableString* comb = [subString mutableCopy];
    char c = [str characterAtIndex:12];
    [comb appendFormat:@"%c", c];
    
    NSLog(@"sbu2 is: %@**sub3 is %@**comb is %@", sub2, sub3, comb);
}
- (void) testOfLinkedList{
    LLNode * head = [[LLNode alloc] init];
    head.val = 1;
    LLNode * node2 = [[LLNode alloc] init];
    node2.val = 2;
    LLNode * node3 = [[LLNode alloc] init];
    node3.val = 3;
    head.next = node2;
    node2.next = node3;
    node3.next = NULL;
    [head printNodes: head];

}

- (int *) productWithoutSelf: (int*) arr forlength:(int) len andReturnLength:(int *)returnLength{
    //int* result = (int*)sizeof(int);
    //
    int* result = malloc(len * sizeof(int));//malloc(len);
    
    // int result[len] is a stack variable and will be undefined behavor for return: function returns address of local variable
    *returnLength = len;
    for (int i = 0; i < len; i++)
        result[i] = 1;
    int dp[2][len];
    dp[0][0] = 1;
    dp[1][len-1] = 1;
    // right to left for row 1
    for (int i = 1; i < len; i++){
        dp[0][i] = dp[0][i-1] * arr[i-1];
    }
    // left to right for row 2
    for (int i = len - 2; i >= 0; i--){
        dp[1][i] = dp[1][i+1] * arr[i+1];
    }
    // get the result
    for (int i = 0; i < len; i++){
        result[i] = dp[0][i] * dp[0][i];
    }
    return result;
}

- (void) stringTests{
    NSString * s1 = @"hello world";
    
    NSRange range = NSMakeRange(2,8);
    //NSString does not have a method like containsString:. Instead, rangeOfString: can be used to check for an NSNotFound location value:
    NSString *input = @"berry, tomato, apple";
    if ([input rangeOfString:@"apple"].location != NSNotFound) {
        NSLog(@"We have apple");
    }

    
}

- (void) blocksTests{
    
    Blockies *blockies = [[Blockies alloc] init];
    [blockies blockTests];
    
}

//-(NSArray*) productWithoutSelf: (NSArray*) arr{
//    int len = (int)[arr count];
//    NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:len];
//    temp[0] = 15;
//    
//    return [temp copy];
//}
/////////////////////////
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
