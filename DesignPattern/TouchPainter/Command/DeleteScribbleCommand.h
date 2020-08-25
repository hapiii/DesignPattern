//
//  DeleteScribbleCommand.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeleteScribbleCommand : Command

- (void) execute;

@end

NS_ASSUME_NONNULL_END
