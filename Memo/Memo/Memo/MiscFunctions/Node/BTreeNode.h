//
//  BTreeNode.h
//  Memo
//
//  Created by Cindy Bi on 8/19/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTreeNode : NSObject{
    
}
@property (strong, nonatomic) BTreeNode *left;
@property (strong, nonatomic) BTreeNode *right;
@property (assign, nonatomic) int val;

- (NSMutableArray *)allPaths:(BTreeNode *) root;
- (void) getAllPath:(BTreeNode *)root aPath:(NSString *)path withResult: (NSMutableArray *) result;
@end
