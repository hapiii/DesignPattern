//
//  AlphaInputValidator.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AlphaInputValidator.h"

@implementation AlphaInputValidator

- (BOOL) validateInput:(UITextField *)input error:(NSError **) error
{
  NSRegularExpression *regex = [NSRegularExpression
                                 regularExpressionWithPattern:@"^[a-zA-Z]*$"
                                 options:NSRegularExpressionAnchorsMatchLines
                                 error:nil];
  
  NSUInteger numberOfMatches = [regex
                                numberOfMatchesInString:[input text]
                                options:NSMatchingAnchored
                                range:NSMakeRange(0, [[input text] length])];
  
  // If there is not a single match
  // then return an error and NO
  if (numberOfMatches == 0)
  {
    if (error != nil)
    {
      NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
      NSString *reason = NSLocalizedString(@"The input can only contain letters", @"");
      
      NSArray *objArray = [NSArray arrayWithObjects:description, reason, nil];
      NSArray *keyArray = [NSArray arrayWithObjects:NSLocalizedDescriptionKey,
                           NSLocalizedFailureReasonErrorKey, nil];
      
      NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:objArray
                                                           forKeys:keyArray];
      *error = [NSError errorWithDomain:InputValidationErrorDomain
                                   code:1002
                               userInfo:userInfo];
    }

    return NO;
  }
  
  return YES;
}

@end
