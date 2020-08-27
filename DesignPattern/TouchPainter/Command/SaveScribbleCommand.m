//
//  SaveScribbleCommand.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "ScribbleManager.h"
#import "CoordinatingController.h"
#import "UIView+UIImage.h"

@implementation SaveScribbleCommand

- (void) execute
{
  // get a hold of all necessary information
  // from an instance of CanvasViewController
  // for saving its Scribble
  CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
  CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
  UIImage *canvasViewImage = [[canvasViewController canvasView] image];
  Scribble *scribble = [canvasViewController scribble];
  
  // use an instance of ScribbleManager
  // to save the scribble and its thumbnail
  ScribbleManager *scribbleManager = [[ScribbleManager alloc] init];
  [scribbleManager saveScribble:scribble thumbnail:canvasViewImage];

  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"涂鸦保存成功!"
                                                      message:nil
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
  [alertView show];
  
}
@end
