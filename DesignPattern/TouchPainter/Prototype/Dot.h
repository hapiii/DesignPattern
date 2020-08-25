//
//  Dot.h
//  DesignPattern
//
//  Created by hapii on 2020/1/11.
//  Copyright © 2020 hapii. All rights reserved.
// 点

#import "Vertex.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dot : Vertex
{
  @private
  UIColor *color_;
  CGFloat size_;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;

// for the Visitor pattern
- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

// for the Prototype pattern
- (id) copyWithZone:(NSZone *)zone;

// for the Memento pattern
- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
