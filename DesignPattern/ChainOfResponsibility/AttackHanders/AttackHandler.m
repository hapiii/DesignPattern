//
//  AttackHandler.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AttackHandler.h"

@implementation AttackHandler

- (void) handleAttack:(Attack *)attack
{
  [_nextAttackHandler handleAttack:attack];
}

@end
