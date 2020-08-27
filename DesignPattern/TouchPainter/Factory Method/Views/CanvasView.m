//
//  CanvasView.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@implementation CanvasView

- (id)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame]))
  {
    // Initialization code
    [self setBackgroundColor:[UIColor whiteColor]];
  }
  return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  
  // Drawing code
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  // create a renderer visitor
  MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
  
  // pass this renderer along the mark composite structure
  [_mark acceptMarkVisitor:markRenderer];
  
}

@end
