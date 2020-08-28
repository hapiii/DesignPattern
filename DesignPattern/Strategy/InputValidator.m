//
//  InputValidator.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator

- (BOOL) validateInput:(UITextField *)input error:(NSError **) error
{
  if (error)
  {
    *error = nil;
  }
  
  return NO;
}

@end
