//
//  ConsoleController.m
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ConsoleController.h"

@implementation ConsoleController
@synthesize emulator=emulator_;

- (void) setCommand:(ConsoleCommand) command
{
  [emulator_ loadInstructionsForCommand:command];
  [emulator_ executeInstructions];
}
@end
