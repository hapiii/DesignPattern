//
//  StandardCharacterBuilder.h
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CharacterBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface StandardCharacterBuilder : CharacterBuilder

- (CharacterBuilder *) buildStrength:(float) value;
- (CharacterBuilder *) buildStamina:(float) value;
- (CharacterBuilder *) buildIntelligence:(float) value;
- (CharacterBuilder *) buildAgility:(float) value;
- (CharacterBuilder *) buildAggressiveness:(float) value;

@end

NS_ASSUME_NONNULL_END
