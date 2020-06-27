//
//  Character.m
//  DesignPattern
//
//  Created by hapii on 2020/6/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Character.h"

@implementation Character

@synthesize protenction = protection_;
@synthesize power = power_;
@synthesize strength = strength_;
@synthesize stamina = stamina_;
@synthesize intelligence = intelligence_;
@synthesize agility = agility_;
@synthesize aggressiveness = aggressiveness_;

- (id)init {
    if (self = [super init]) {
        protection_ = 1.0;
        power_ = 1.0;
        strength_ = 1.0;
        stamina_ = 1.0;
        intelligence_ = 1.0;
        agility_ = 1.0;
        aggressiveness_ = 1.0;
    }
    return self;
}

@end
