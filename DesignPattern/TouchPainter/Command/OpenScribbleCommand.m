//
//  OpenScribbleCommand.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation OpenScribbleCommand


- (id) initWithScribbleSource:(id <ScribbleSource>) aScribbleSource
{
  if (self = [super init])
  {
    [self setScribbleSource:aScribbleSource];
  }
  
  return self;
}

- (void) execute {
  // get a scribble from the scribbleSource_
  Scribble *scribble = [_scribbleSource scribble];
  
  // set it to the current CanvasViewController
  CoordinatingController *coordinator = [CoordinatingController sharedInstance];
  CanvasViewController *controller = [coordinator canvasViewController];
  [controller setScribble:scribble];
  
  // then tell the coordinator to change views
  [coordinator requestViewChangeByObject:self];
}

@end

