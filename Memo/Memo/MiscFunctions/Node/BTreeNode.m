//
//  BTreeNode.m
//  Memo
//
//  Created by Cindy Bi on 8/19/15.
//  Copyright © 2015 XintongBi. All rights reserved.
//

#import "BTreeNode.h"

@implementation BTreeNode

- (NSMutableArray *)allPaths:(BTreeNode *) root{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if(root == NULL) return result;
    [self getAllPath:root aPath:@"" withResult:result];
   
    return result;
}

- (void)getAllPath:(BTreeNode *)root aPath:(NSString *)path withResult: (NSMutableArray *) result  {
    if(root.left == NULL && root.right ==NULL){
        path = [path stringByAppendingFormat:@"%d", root.val];
        [result addObject:path];
    }
    
    if (root.left){
        [self getAllPath:root.left aPath:[NSString stringWithFormat:@"%@%d->", path, root.val] withResult:result];
    }
    if(root.right){
        [self getAllPath:root.right aPath:[NSString stringWithFormat:@"%@%d->", path, root.val] withResult:result];
    }
}
@end
