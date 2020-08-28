//
//  ImageTransformFilter.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ImageTransformFilter.h"

@implementation ImageTransformFilter

@synthesize transform=transform_;

- (id) initWithImageComponent:(id <ImageComponent>)component
                    transform:(CGAffineTransform)transform
{
  if (self = [super initWithImageComponent:component])
  {
    [self setTransform:transform];
  }
  return self;
}

- (void) apply
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  // 设置形变
  CGContextConcatCTM(context, transform_);
}

@end
