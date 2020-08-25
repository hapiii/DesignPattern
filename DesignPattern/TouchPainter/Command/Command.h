//
//  Command.h
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Command : NSObject

@property (nonatomic, copy) NSDictionary *userInfo;

- (void)execute;

- (void)undo;

@end

NS_ASSUME_NONNULL_END
