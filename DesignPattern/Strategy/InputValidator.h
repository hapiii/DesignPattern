//
//  InputValidator.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
static NSString * const InputValidationErrorDomain = @"InputValidationErrorDomain";

@interface InputValidator : NSObject
///传入Error的思想可以学习,比如:moveItemAtPath
- (BOOL) validateInput:(UITextField *)input error:(NSError **) error;

@end

NS_ASSUME_NONNULL_END
