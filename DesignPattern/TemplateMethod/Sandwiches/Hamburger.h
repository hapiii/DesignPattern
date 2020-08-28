//
//  Hamburger.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AnySandwich.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hamburger : AnySandwich

- (void) prepareBread;
- (void) addMeat;
- (void) addCondiments;
//- (void) extraStep;

// Hamburger specific methods
- (void) getBurgerBun;
- (void) addKetchup;
- (void) addMustard;
- (void) addBeefPatty;
- (void) addCheese;
- (void) addPickles;

@end

NS_ASSUME_NONNULL_END
