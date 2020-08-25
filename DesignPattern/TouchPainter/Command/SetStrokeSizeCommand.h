//
//  SetStrokeSizeCommand.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Command.h"
#import <UIKit/UIKit.h>

@class SetStrokeSizeCommand;

@protocol SetStrokeSizeCommandDelegate

- (void) command:(SetStrokeSizeCommand *)command
                didRequestForStrokeSize:(CGFloat *)size;

@end


NS_ASSUME_NONNULL_BEGIN

@interface SetStrokeSizeCommand : Command

@property (nonatomic, assign) id <SetStrokeSizeCommandDelegate> delegate;

- (void) execute;

@end

NS_ASSUME_NONNULL_END
