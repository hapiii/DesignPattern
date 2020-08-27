//
//  TouchConsoleController.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ConsoleController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TouchConsoleController : ConsoleController

- (void) up;
- (void) down;
- (void) left;
- (void) right;
- (void) select;
- (void) start;
- (void) action1;
- (void) action2;

@end

NS_ASSUME_NONNULL_END
