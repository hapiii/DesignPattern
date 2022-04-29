//
//  OpenScribbleCommand.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Command.h"
#import "Command.h"
#import "ScribbleSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenScribbleCommand : Command


@property (nonatomic, retain) id <ScribbleSource> scribbleSource;

- (id) initWithScribbleSource:(id <ScribbleSource>) aScribbleSource;
- (void) execute;

@end

NS_ASSUME_NONNULL_END
