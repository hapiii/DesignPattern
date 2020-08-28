//
//  Avatar.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Avatar.h"

@implementation Avatar

- (void) handleAttack:(Attack *)attack
{
  // when an attack reaches this point,
  // I'm hit.
  // actual points taken off depends on
  // the type of attack.
  NSLog(@"Oh! I'm hit with a %@!", [attack class]);

}
@end
