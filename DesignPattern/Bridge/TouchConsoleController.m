//
//  TouchConsoleController.m
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "TouchConsoleController.h"
#import "ConsoleEmulator.h"

@implementation TouchConsoleController

- (void) up
{
  [super setCommand:kConsoleCommandUp];
}

- (void) down
{
  [super setCommand:kConsoleCommandDown];
}

- (void) left
{
  [super setCommand:kConsoleCommandLeft];
}

- (void) right
{
  [super setCommand:kConsoleCommandRight];
}

- (void) select
{
  [super setCommand:kConsoleCommandSelect];
}

- (void) start
{
  [super setCommand:kConsoleCommandStart];
}

- (void) action1
{
  [super setCommand:kConsoleCommandAction1];
}

- (void) action2
{
  [super setCommand:kConsoleCommandAction2];
}

@end
