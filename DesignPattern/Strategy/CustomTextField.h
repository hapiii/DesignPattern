//
//  CustomTextField.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomTextField : UITextField

@property (nonatomic, strong) InputValidator *inputValidator;

- (BOOL) validate;

@end

NS_ASSUME_NONNULL_END
