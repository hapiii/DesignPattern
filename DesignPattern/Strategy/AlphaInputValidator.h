//
//  AlphaInputValidator.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "InputValidator.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlphaInputValidator : InputValidator

- (BOOL) validateInput:(UITextField *)input error:(NSError **) error;

@end

NS_ASSUME_NONNULL_END
