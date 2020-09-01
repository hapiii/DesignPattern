//
//  ConsoleController.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleEmulator.h"
#import "ConsoleCommands.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsoleController : NSObject
{
  @private
  ConsoleEmulator *emulator_;
}
///唯一的桥
@property (nonatomic, strong) ConsoleEmulator *emulator;

- (void) setCommand:(ConsoleCommand) command;

@end

NS_ASSUME_NONNULL_END
