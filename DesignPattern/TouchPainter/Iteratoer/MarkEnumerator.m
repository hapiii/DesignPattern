//
//  MarkEnumerator.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "MarkEnumerator.h"
#import "MarkEnumerator+Internal.h"

@implementation MarkEnumerator

- (NSArray *)allObjects
{
  // returns an array of yet-visited Mark nodes
  // i.e. the remaining elements in the stack
  return [[stack_ reverseObjectEnumerator] allObjects];
}

- (id)nextObject
{
  return [stack_ pop];
}



#pragma mark -
#pragma mark Private Methods

- (id) initWithMark:(id <Mark>)aMark
{
  if (self = [super init])
  {
    stack_ = [[NSMutableArray alloc] initWithCapacity:[aMark count]];
    
    // post-orderly traverse the whole Mark aggregate
    // and add individual Marks in a private stack
    [self traverseAndBuildStackWithMark:aMark];
  }
  
  return self;
}

- (void) traverseAndBuildStackWithMark:(id <Mark>)mark
{
  // push post-order traversal
  // into the stack
  if (mark == nil) return;
  
  [stack_ push:mark];
  
  NSUInteger index = [mark count];
  id <Mark> childMark;
  while (childMark = [mark childMarkAtIndex:--index])
  {
    [self traverseAndBuildStackWithMark:childMark];
  }
}

@end
