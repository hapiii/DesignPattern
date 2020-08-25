//
//  ClothCanvasViewGenerator.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ClothCanvasViewGenerator.h"
#import "ClothCanvasView.h"

@implementation ClothCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    return [[ClothCanvasView alloc] initWithFrame:aFrame];
}

@end
