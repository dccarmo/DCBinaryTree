//
//  DCBinaryTree.h
//
//  Created by Diogo do Carmo on 24/10/13.
//
//

#import <Foundation/Foundation.h>

@interface DCBinaryTree : NSObject

@property (retain, nonatomic) id content;
@property (retain, nonatomic) DCBinaryTree *parent;
@property (retain, nonatomic) DCBinaryTree *left;
@property (retain, nonatomic) DCBinaryTree *right;

- (id)initWithContent:(id)content andParent:(DCBinaryTree *)parent;
- (void)releaseTreeUnderAndIncluding:(DCBinaryTree *)node;
- (NSInteger)createTreeFromArray:(NSArray *)array nullPointerAs:(NSString *)nullPointer startingFromIndex:(NSInteger)index;
- (void)insertLeft:(id)object;
- (void)insertRight:(id)object;
- (BOOL)isLeafNode;
- (BOOL)isRootNode;

@end
