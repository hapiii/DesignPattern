//
//  CrystalShield.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CrystalShield.h"
#import "MagicFireAttack.h"

@implementation CrystalShield

- (void) handleAttack:(Attack *)attack
{
    //如果是魔法攻击
  if ([attack isKindOfClass:[MagicFireAttack class]])
  {
    // no damage beyond this shield
    NSLog(@"%@", @"No damage from a magic fire attack!");
  }
  else
  {
    NSLog(@"I don't know this attack: %@", [attack class]);
    [super handleAttack:attack];
  }
}

@end
