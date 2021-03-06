//
//  Stroke.m
//  DesignPattern
//
//  Created by hapii on 2020/1/11.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator+Internal.h"

@implementation Stroke
@synthesize color = color_,size = size_;
@dynamic location;

- (id) init
{
  if (self = [super init])
  {
    children_ = [[NSMutableArray alloc] initWithCapacity:5];
  }
  
  return self;
}

- (void) setLocation:(CGPoint)aPoint
{
  // it doesn't set any arbitrary location
}

- (CGPoint) location
{
  // 返回第一个子节点的位置
  if ([children_ count] > 0)
  {
    return [[children_ objectAtIndex:0] location];
  }
  
  // 否则返回原点
  return CGPointZero;
}

- (void) addMark:(id <Mark>) mark
{
  [children_ addObject:mark];
}

- (void) removeMark:(id <Mark>) mark
{
  //如果mark再这一层,将其移出并返回
  if ([children_ containsObject:mark])
  {
    [children_ removeObject:mark];
  }
  else
  {
      ///让数组中的每个对象调用移出
    [children_ makeObjectsPerformSelector:@selector(removeMark:)
                               withObject:mark];
  }
}


- (id <Mark>) childMarkAtIndex:(NSUInteger) index
{
  if (index >= [children_ count]) return nil;
  
  return [children_ objectAtIndex:index];
}


// a convenience method to return the last child
- (id <Mark>) lastChild
{
  return [children_ lastObject];
}

// returns number of children
- (NSUInteger) count
{
  return [children_ count];
}


- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor
{
  for (id <Mark> dot in children_)
  {
    [dot acceptMarkVisitor:visitor];
  }
  
  [visitor visitStroke:self];
}

#pragma mark -
#pragma mark NSCopying method


- (id)copyWithZone:(NSZone *)zone
{
  Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
  
  // copy the color
  [strokeCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
  
  // copy the size
  [strokeCopy setSize:size_];
  
  // copy the children
  for (id <Mark> child in children_)
  {
    id <Mark> childCopy = [child copy];
    [strokeCopy addMark:child];
  }
  
  return strokeCopy;
}

#pragma mark -
#pragma mark NSCoder methods

- (id)initWithCoder:(NSCoder *)coder
{
  if (self = [super init])
  {
    color_ = [coder decodeObjectForKey:@"StrokeColor"];
    size_ = [coder decodeFloatForKey:@"StrokeSize"];
    children_ = [coder decodeObjectForKey:@"StrokeChildren"];
  }
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:color_ forKey:@"StrokeColor"];
  [coder encodeFloat:size_ forKey:@"StrokeSize"];
  [coder encodeObject:children_ forKey:@"StrokeChildren"];
}

#pragma mark -
#pragma mark enumerator methods

- (NSEnumerator *) enumerator
{
  return [[MarkEnumerator alloc] initWithMark:self];
}

- (void) enumerateMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop)) block
{
  BOOL stop = NO;
  
  NSEnumerator *enumerator = [self enumerator];
  
  for (id <Mark> mark in enumerator)
  {
    block (mark, &stop);
    if (stop)
      break;
  }
}

#pragma mark -
#pragma mark An Extended Direct-draw Example

// for a direct draw example
- (void) drawWithContext:(CGContextRef)context
{
  CGContextMoveToPoint(context, self.location.x, self.location.y);
  
  for (id <Mark> mark in children_)
  {
    [mark drawWithContext:context];
  }
  
  CGContextSetLineWidth(context, self.size);
  CGContextSetLineCap(context, kCGLineCapRound);
  CGContextSetStrokeColorWithColor(context,[self.color CGColor]);
  CGContextStrokePath(context);
}

@end
