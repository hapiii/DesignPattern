//
//  SetStrokeColorCommand.m
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation SetStrokeColorCommand

- (void) execute
{
  CGFloat redValue = 0.0;
  CGFloat greenValue = 0.0;
  CGFloat blueValue = 0.0;
  
  // Retrieve RGB values from a delegate or a block
  
  // Delegation (object adapter) approach:
  [_delegate command:self didRequestColorComponentsForRed:&redValue
                                                    green:&greenValue
                                                     blue:&blueValue];
  
  // Block approach:
  if (_RGBValuesProvider != nil) {
      _RGBValuesProvider(&redValue, &greenValue, &blueValue);
  }
  
  // Create a color object based on the RGB values
  UIColor *color = [UIColor colorWithRed:redValue
                                   green:greenValue
                                    blue:blueValue
                                   alpha:1.0];
  
  // Assign it to the current canvasViewController
  CoordinatingController *coordinator = [CoordinatingController sharedInstance];
  CanvasViewController *controller = [coordinator canvasViewController];
  [controller setStrokeColor:color];
  
  // Forward a post update message
  
  // Delegation approach:
  [_delegate command:self didFinishColorUpdateWithColor:color];
  
  // Block approach:
  if (_postColorUpdateProvider != nil)
  {
      _postColorUpdateProvider(color);
  }
}



@end

