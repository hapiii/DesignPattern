//
//  GameBoyEmulator.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ConsoleEmulator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameBoyEmulator : ConsoleEmulator
{

}

// overridden behaviors from the abstract class
- (void) loadInstructionsForCommand:(ConsoleCommand) command;
- (void) executeInstructions;

@end

NS_ASSUME_NONNULL_END
