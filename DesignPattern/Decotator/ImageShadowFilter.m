//
//  ImageShadowFilter.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ImageShadowFilter.h"

@implementation ImageShadowFilter

- (void) apply
{
    ///获取上下文
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  //设置shadow
  CGSize offset = CGSizeMake (-25,  15);
  CGContextSetShadow(context, offset, 20.0);
}

@end
