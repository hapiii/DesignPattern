//
//  CustomTextField.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (BOOL) validate
{
  NSError *error = nil;
  BOOL validationResult = [_inputValidator validateInput:self error:&error];
  
  if (!validationResult)
  {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error localizedDescription]
                                                        message:[error localizedFailureReason]
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                              otherButtonTitles:nil];
    [alertView show];
  }
  
  return validationResult;
}

@end
