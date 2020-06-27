//
//  ChasingGame.m
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ChasingGame.h"

@implementation ChasingGame
///构建游戏者
- (Character *) createPlayer:(CharacterBuilder *) builder
{
  [builder buildNewCharacter];
  [builder buildStrength:50.0];
  [builder buildStamina:25.0];
  [builder buildIntelligence:75.0];
  [builder buildAgility:65.0];
  [builder buildAggressiveness:35.0];
  
  // 构建角色的另一种语法风格
  [[[[[[builder buildNewCharacter]
       buildStrength:50.0]
      buildStamina:25.0]
     buildIntelligence:75.0]
    buildAgility:65.0]
   buildAggressiveness:35.0];
  
  return [builder character];
}

///构建敌人
- (Character *) createEnemy:(CharacterBuilder *) builder
{
  [builder buildNewCharacter];
  [builder buildStrength:80.0];
  [builder buildStamina:65.0];
  [builder buildIntelligence:35.0];
  [builder buildAgility:25.0];
  [builder buildAggressiveness:95.0];
  
  return [builder character];
}

@end
