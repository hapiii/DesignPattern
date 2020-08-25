//
//  SetStrokeSizeCommand.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "SetStrokeSizeCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation SetStrokeSizeCommand

@synthesize delegate=delegate_;

- (void) execute
{
  // get the current stroke size
  // from whatever it's my delegate
  CGFloat strokeSize = 1;
  [delegate_ command:self didRequestForStrokeSize:&strokeSize];
  
  // get a hold of the current
  // canvasViewController from
  // the coordinatingController
  // (see the Mediator pattern chapter
  // for details)
  CoordinatingController *coordinator = [CoordinatingController sharedInstance];
  CanvasViewController *controller = [coordinator canvasViewController];
  
  // assign the stroke size to
  // the canvasViewController
  [controller setStrokeSize:strokeSize];
}

@end

