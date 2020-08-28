//
//  CrystalShield.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AttackHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface CrystalShield : AttackHandler

- (void) handleAttack:(Attack *)attack;

@end

NS_ASSUME_NONNULL_END
