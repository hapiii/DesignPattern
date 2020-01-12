//
//  PaperCanvasViewGenerator.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"
#import "PaperCanvasView.h"

@implementation PaperCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    return [[PaperCanvasView alloc] initWithFrame:aFrame];
}

@end
