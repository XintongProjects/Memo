//
//  MiscTest.m
//  Memo
//
//  Created by Cindy Bi on 11/29/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Misc.h"

@interface MiscTest : XCTestCase

@end

@implementation MiscTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIf2StringsMatch {
    Misc *miscClass = [Misc new];
    NSString *string1 = @"we like hiking";
    NSString *string2 = @"w king";
    BOOL isMatch = [miscClass isMatchingWords:string1 mapWith:string2];
}

- (void)testIf2StringsNotMatch {
    Misc *miscClass = [Misc new];
    NSString *string1 = @"we like hiking";
    NSString *string2 = @"w h ing";
    BOOL isMatch = [miscClass isMatchingWords:string1 mapWith:string2];
    XCTAssertTrue(isMatch == NO, @"Should not be a match");
}


//- (BOOL)isMatchingWords: (NSString *)input mapWith: (NSString *)mapping;


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
