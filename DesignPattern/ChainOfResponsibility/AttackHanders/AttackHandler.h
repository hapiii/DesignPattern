//
//  AttackHandler.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attack.h"

NS_ASSUME_NONNULL_BEGIN

@interface AttackHandler : NSObject

@property (nonatomic, strong) AttackHandler *nextAttackHandler;

- (void) handleAttack:(Attack *)attack;

@end

NS_ASSUME_NONNULL_END
