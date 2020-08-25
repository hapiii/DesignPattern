//
//  DeleteScribbleCommand.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation DeleteScribbleCommand

- (void) execute
{
  // get a hold of the current
  // CanvasViewController from
  // the CoordinatingController
  CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
  CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
  
  // create a new scribble for
  // canvasViewController
  Scribble *newScribble = [[Scribble alloc] init];
  [canvasViewController setScribble:newScribble];
}

@end
