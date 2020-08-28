//
//  StrategyViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "StrategyViewController.h"
#import "CustomTextField.h"
#import "NumericInputValidator.h"
#import "AlphaInputValidator.h"

@interface StrategyViewController ()<UITextFieldDelegate>

@end

@implementation StrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomTextField *tf1 = [[CustomTextField alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width - 100, 50)];
    tf1.delegate = self;
    tf1.inputValidator = [[NumericInputValidator alloc] init];
    [self.view addSubview:tf1];
    
    CustomTextField *tf2 = [[CustomTextField alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width - 100, 50)];
    tf2.inputValidator = [[AlphaInputValidator alloc] init];
    tf2.delegate = self;
    [self.view addSubview:tf2];
    
    // Do any additional setup after loading the view.
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  //if (textField == numericTextField)
  //{
  // validate [textField text] and make sure
  // the value is numeric
  //}
  //else if (textField == alphaTextField)
  //{
  // validate [textField text] and make sure
  // the value contains only letters
  //}
  
  if ([textField isKindOfClass:[CustomTextField class]])
  {
    [(CustomTextField*)textField validate];
  }
}

@end
