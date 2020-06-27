//
//  StandardCharacterBuilder.m
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "StandardCharacterBuilder.h"
#import "Character.h"

@implementation StandardCharacterBuilder

- (CharacterBuilder *) buildStrength:(float) value
{
  // 更新角色防御值
  character_.protenction *= value;
  // 更新攻击力
  character_.power *= value;
  
  // 设定力量值并返回此生成器
  return [super buildStrength:value];
}

- (CharacterBuilder *) buildStamina:(float) value
{
  // update the protection value of the character
  character_.protenction *= value;
  
  // update the power value of the character
  character_.power *= value;
  
  // 设定耐力并返回此生成器
  return [super buildStamina:value];
}

- (CharacterBuilder *) buildIntelligence:(float) value
{
  // update the protection value of the character
  character_.protenction *= value;
  
  // update the power value of the character
  character_.power /= value;
  
  // 设定智力并返回此生成器
  return [super buildIntelligence:value];
}

- (CharacterBuilder *) buildAgility:(float) value
{
  // update the protection value of the character
  character_.protenction *= value;
  
  // update the power value of the character
  character_.power /= value;
  
  // 设定敏捷并返回此生成器
  return [super buildAgility:value];
}

- (CharacterBuilder *) buildAggressiveness:(float) value
{
  // update the protection value of the character
  character_.protenction /= value;
  
  // update the power value of the character
  character_.power *= value;
  
  // 设定攻击力并返回此生成器
  return [super buildAggressiveness:value];
}


@end
