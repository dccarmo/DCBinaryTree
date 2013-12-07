//
//  DCBinaryTree.m
//
//  Created by Diogo do Carmo on 24/10/13.
//
//

#import "DCBinaryTree.h"

@interface DCBinaryTree ()

@end

@implementation DCBinaryTree

@synthesize left;
@synthesize right;

- (id)initWithContent:(id)content andParent:(DCBinaryTree *)parent {
    self = [super init];
    
    self.content = content;
    self.parent = parent;
    self.left = nil;
    self.right = nil;
    
    return self;
}

- (void)releaseTreeUnderAndIncluding:(DCBinaryTree *)node {
    if (!node) {
        return;
    }
    
    [self releaseTreeUnderAndIncluding:node.left];
    [self releaseTreeUnderAndIncluding:node.right];
    
    [node release];
}

- (NSInteger)createTreeFromArray:(NSArray *)array nullPointerAs:(NSString *)nullPointer startingFromIndex:(NSInteger)index {
    if (index < array.count && ![[array objectAtIndex:index] isEqualToString:nullPointer]) {
        self.content = [array objectAtIndex:index];
    } else {
        return index;
    }

    NSInteger leftIndex, rightIndex;
    
    self.left = [[DCBinaryTree alloc] initWithContent:nil andParent:self];
    leftIndex = [self.left createTreeFromArray:array nullPointerAs:nullPointer startingFromIndex:index + 1];
    if (index + 1 == leftIndex) {
        [self.left release];
        self.left = nil;
    }

    self.right = [[DCBinaryTree alloc] initWithContent:nil andParent:self];
    rightIndex = [self.right createTreeFromArray:array nullPointerAs:nullPointer startingFromIndex:leftIndex + 1];
    if (leftIndex + 1 == rightIndex) {
        [self.right release];
        self.right = nil;
    }

    return rightIndex;
}

- (void)insertLeft:(id)object {
    self.left = [[DCBinaryTree alloc] initWithContent:object andParent:self];
}

- (void)insertRight:(id)object {
    self.right = [[DCBinaryTree alloc] initWithContent:object andParent:self];
}

- (BOOL)isLeafNode {
    if (!self.left && !self.right) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isRootNode {
    if (!self.parent) {
        return YES;
    }
    
    return NO;
}

@end
