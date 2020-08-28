//
//  AnySandwich.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AnySandwich.h"

@implementation AnySandwich

- (void) make {
  [self prepareBread];
  [self putBreadOnPlate];
  [self addMeat];
  [self addCondiments];
  [self extraStep];
  [self serve];
}

- (void) putBreadOnPlate
{
  // We need first to put bread on a plate for any sandwich.
}

- (void) serve
{
  // Any sandwich will be served eventually.
}

#pragma mark -
#pragma Details will be handled by subclasses

- (void) prepareBread
{
  
  [NSException raise:NSInternalInconsistencyException
              format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) addMeat
{
  [NSException raise:NSInternalInconsistencyException
              format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) addCondiments
{
  [NSException raise:NSInternalInconsistencyException
              format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) extraStep{}
@end
