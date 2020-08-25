//
//  CanvasViewGenerator.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "CanvasView.h"

@implementation CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    return [[CanvasView alloc] initWithFrame:aFrame];
}

@end
