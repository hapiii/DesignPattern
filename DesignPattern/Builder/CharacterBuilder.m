//
//  CharacterBuilder.m
//  DesignPattern
//
//  Created by hapii on 2020/6/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CharacterBuilder.h"
#import "Character.h"

@implementation CharacterBuilder

@synthesize character=character_;


- (CharacterBuilder *) buildNewCharacter
{
  character_ = [[Character alloc] init];
  
  return self;
}

- (CharacterBuilder *) buildStrength:(float) value
{
  character_.strength = value;
  return self;
}

- (CharacterBuilder *) buildStamina:(float) value
{
  character_.stamina = value;
  return self;
}

- (CharacterBuilder *) buildIntelligence:(float) value
{
  character_.intelligence = value;
  return self;
}

- (CharacterBuilder *) buildAgility:(float) value
{
  character_.agility = value;
  return self;
}

- (CharacterBuilder *) buildAggressiveness:(float) value
{
  character_.aggressiveness = value;
  return self;
}

@end
