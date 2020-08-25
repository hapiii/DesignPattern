//
//  MarkRenderer.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkRenderer : NSObject<MarkVisitor>
{
  @private
  BOOL shouldMoveContextToDot_;
  
  @protected
  CGContextRef context_;
}

- (id) initWithCGContext:(CGContextRef)context;

- (void) visitMark:(id <Mark>)mark;
- (void) visitDot:(Dot *)dot;
- (void) visitVertex:(Vertex *)vertex;
- (void) visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END
