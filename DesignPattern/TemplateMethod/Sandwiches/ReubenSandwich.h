//
//  ReubenSandwich.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AnySandwich.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReubenSandwich : AnySandwich

- (void) prepareBread;
- (void) addMeat;
- (void) addCondiments;
- (void) extraStep;


- (void) cutRyeBread;
// 大量腌制牛肉
- (void) addCornBeef;
///德国酸菜
- (void) addSauerkraut;
///千岛酱
- (void) addThousandIslandDressing;
///奶酪
- (void) addSwissCheese;
- (void) grillIt;

@end

NS_ASSUME_NONNULL_END
