//
//  GameClient.m
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "GameClient.h"
#import "ChasingGame.h"
#import "StandardCharacterBuilder.h"

@implementation GameClient

- (instancetype)init {
    if (self = [super init]) {
        
        CharacterBuilder *standardCharacterBuilder = [[StandardCharacterBuilder alloc] init];
        CharacterBuilder *characterBuilder = [[CharacterBuilder alloc] init];
        ChasingGame *game = [[ChasingGame alloc] init];
        
        Character *player = [game createPlayer:standardCharacterBuilder];
        Character *enemy = [game createEnemy:characterBuilder];
    }
    return self;
}

@end
