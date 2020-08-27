//
//  ConsoleEmulator.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleCommands.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsoleEmulator : NSObject

- (void) loadInstructionsForCommand:(ConsoleCommand) command;
- (void) executeInstructions;

@end

NS_ASSUME_NONNULL_END
