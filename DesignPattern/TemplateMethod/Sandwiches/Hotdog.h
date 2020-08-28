//
//  Hotdog.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AnySandwich.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hotdog : AnySandwich

- (void) prepareBread;
- (void) addMeat;
- (void) addCondiments;
//- (void) extraStep;

// Hotdog specific methods
- (void) getHotdogBun;
- (void) addWiener;
- (void) addKetchup;
- (void) addMustard;
- (void) addOnion;

@end

NS_ASSUME_NONNULL_END
