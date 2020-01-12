//
//  CanvasViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasViewGenerator.h"
#import "CanvasView.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController
@synthesize canvasView = canvasView_;
- (void)viewDidLoad {
    [super viewDidLoad];
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [canvasView_ removeFromSuperview];
    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
    [self setCanvasView:aCanvasView];
    [self.view addSubview:canvasView_];
}

@end
