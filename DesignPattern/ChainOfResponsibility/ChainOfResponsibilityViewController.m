//
//  ChainOfResponsibilityViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ChainOfResponsibilityViewController.h"
#import "Avatar.h"
#import "MetalArmor.h"
#import "CrystalShield.h"
#import "SwordAttack.h"
#import "MagicFireAttack.h"
#import "LightningAttack.h"

@interface ChainOfResponsibilityViewController ()

@end

@implementation ChainOfResponsibilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建新人物
    AttackHandler *avatar = [[Avatar alloc] init];
      
     //穿上金属盔甲
      AttackHandler *metalArmoredAvatar = [[MetalArmor alloc] init];
    [metalArmoredAvatar setNextAttackHandler:avatar];
      
     //穿上水晶盾牌
      AttackHandler *superAvatar = [[CrystalShield alloc] init];
      [superAvatar setNextAttackHandler:metalArmoredAvatar];
      
      //剑攻击
      Attack *swordAttack = [[SwordAttack alloc] init];
      [superAvatar handleAttack:swordAttack];
      
     //魔法攻击
      Attack *magicFireAttack = [[MagicFireAttack alloc] init];
      [superAvatar handleAttack:magicFireAttack];
      
      //闪电攻击
      Attack *lightningAttack = [[LightningAttack alloc] init];
      [superAvatar handleAttack:lightningAttack];
      
      // ... further actions
    }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
