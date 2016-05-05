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
#import "Misc.h"
#import "NSArray+Shuffle.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self runtests];
    // Override point for customization after application launch.
    
    dispatch_queue_t downLoadQueue = dispatch_queue_create("Hello", NULL);
    dispatch_async(downLoadQueue, ^{
        NSLog(@"can perform long process here");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // update UI
        });
    });
    return YES;
}

-(void) runtests{
    [self testOfLinkedList];
    [self testOfString];
    [self stringTests];
    [self blocksTests];
    [self NSMapTableTests];
    [self NSSetTests];
    [self leetCodeTests];
    [self miscTests];
}

-(void) miscTests{
    Misc *mis = [[Misc alloc] init];
    [mis findAllPairs];
    [mis randomNumbers];
    [mis isMatchingWords:@"Hello how are you about" mapWith:@"elo h ey"];
    [mis createGraph];
    NSArray *inputArr = [NSArray arrayWithObjects:@"A",@"B", @"E", @"c", @"A", @"A",@"B", @"D", @"c", @"A", nil];
    inputArr = [ inputArr cbi_shuffleArray:inputArr];
    NSLog(@"inputApr is %@", inputArr);
    
}
-(void) leetCodeTests{
    
    NSString *multiResult;
    NSString *s1 = @"12";
    NSString *s2 = @"15";
    //int a = [self multiplyStrings:s1 multiplyWith:s2 to:multiResult];
    //NSLog(@"a is %d, and multiResult: %@", a, multiResult);
    multiResult = [self multiplyStrings:s1 multiplyWith:s2];
    NSLog(@"multiResult: %@", multiResult);
    
}

// #43 Multiply Strings;
// assume all positive,
- (int) multiplyStrings: (NSString *) s1  multiplyWith: (NSString*)s2 to: (NSString*) result{
    
    return -1;
}

- (NSString *) multiplyStrings: (NSString *) s1  multiplyWith: (NSString*)s2{
    int len1 = (int)s1.length;
    int len2 = (int)s2.length;
    
    NSMutableString *ms = [NSMutableString stringWithCapacity:len1+len2];
    
    
    return [NSString stringWithString:ms];
    //@"2222";
}

- (BOOL) isValidInteger: (NSString*) num{
    for (int i = 0; i < num.length; i++){
        if([num characterAtIndex:i] < '0' || [num characterAtIndex:i] > '9') return NO;
            
    }
    return YES;
}

//NSMapTable  equivalent to java's Hashmap, available iOS 6+
-(void) NSMapTableTests{
    NSString * key1 = @"key1";
    NSString *key2 = @"key2";
    NSNumber *val1 = [NSNumber numberWithInt: 12];
    NSNumber *val2 = [NSNumber numberWithInt: 17];
    //NSMapTable * map = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableWeakMemory];
    
    NSMapTable * mapTable = [[NSMapTable alloc] init];
    [mapTable setObject:val1 forKey:key1];
    [mapTable setObject:val2 forKey:key2];
    NSLog(@"mapTable is %@", mapTable);
}

//NSMutableSet, similar to java's Hashset
-(void) NSSetTests{
    NSArray *myArr = @[@"Hello", @"World", @"Hello"];
    NSSet * words = [NSSet setWithArray:myArr];
    //NSSet * words = [NSSet setWithObjects:@"m", "m", "hello", "ou", nil
    NSLog(@"words is %@", words);
    for (id item in words){
        NSLog(@"Item is %@", item);
    }

    
    
    NSMutableSet *container = [[NSMutableSet alloc] init];
    [container addObject:@"a"];
    [container addObject:@"b"];
    if([container containsObject:@"a"]){
        NSLog(@"container has \"a\"");
    }
    
}
-(void) testOfString{
    
    NSString* str = @"Hello world KAYAK";
    NSLog(@"str[1] is %c",[str characterAtIndex: 1]); //'e'
    NSString *subString = [str substringWithRange:NSMakeRange(0, 8)];
    NSLog(@"sbustring (0, 8)is %@", subString);
    NSString *sub2 = [str substringFromIndex:1];
    NSString *sub3 = [str substringToIndex:14];

    //from NSString to NSmutableString
    NSMutableString* comb = [subString mutableCopy];
    char c = [str characterAtIndex:12];
    [comb appendFormat:@"%c", c];
    
    NSLog(@"sbu2 is: %@**sub3 is %@**comb is %@", sub2, sub3, comb);
    
    
    NSMutableString *s1 = [@"hello world" mutableCopy];
    [s1 insertString:@"**" atIndex:5] ;
    NSLog(@"s1 is :%@", s1);
 
    //NSRange range = NSMakeRange(2,8);
    
    //NSString does not have a method like containsString:. Instead, rangeOfString: can be used to check for an NSNotFound location value:
    NSString *input = @"berry, tomato, apple";
    if ([input rangeOfString:@"apple"].location != NSNotFound) {
        NSLog(@"We have apple");
    }
    
    
    NSString *a1 = @"go";
    NSString *a2 = @"ahead";
    NSString *a3 = [a1 stringByAppendingString:@" "];
    NSString *a4 = [a3 stringByAppendingString:a2];//s1 + @" " + s2;
    NSLog(@"s4:%@", a4);//"go ahead"
    
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
    ;
    
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
