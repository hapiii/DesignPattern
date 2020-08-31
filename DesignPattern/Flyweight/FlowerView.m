//
//  FlowerView.m
//  DesignPattern
//
//  Created by hapii on 2020/8/31.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "FlowerView.h"

@implementation FlowerView

- (void) drawRect:(CGRect)rect
{
  [self.image drawInRect:rect];
}

@end
