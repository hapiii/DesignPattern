//
//  Hamburger.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Hamburger.h"

@implementation Hamburger

- (void) prepareBread;
{
  [self getBurgerBun];
}

- (void) addMeat
{
  [self addBeefPatty];
}

- (void) addCondiments
{
  [self addKetchup];
  [self addMustard];
  [self addCheese];
  [self addPickles];
}

#pragma mark -
#pragma mark Hamburger Specific Methods

- (void) getBurgerBun
{
  // A hamburger needs a bun.
}

- (void) addKetchup
{
  // Before adding anything to a bun, we need to put ketchup.
}

- (void) addMustard
{
  // Then add some mustard.
}

- (void) addBeefPatty
{
  // A piece of beef patty is the main character in a burger.
}

- (void) addCheese
{
  // Let's just assume every burger has cheese.
}

- (void) addPickles
{
  // Then finally add some pickles to it.
}

@end
