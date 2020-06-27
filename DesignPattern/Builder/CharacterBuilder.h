//
//  CharacterBuilder.h
//  DesignPattern
//
//  Created by hapii on 2020/6/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Character;

NS_ASSUME_NONNULL_BEGIN

@interface CharacterBuilder : NSObject{
  @protected
  Character *character_;
}

@property (nonatomic, readonly) Character *character;
///构建Character对象
- (CharacterBuilder *) buildNewCharacter;
- (CharacterBuilder *) buildStrength:(float) value;
- (CharacterBuilder *) buildStamina:(float) value;
- (CharacterBuilder *) buildIntelligence:(float) value;
- (CharacterBuilder *) buildAgility:(float) value;
- (CharacterBuilder *) buildAggressiveness:(float) value;

@end

NS_ASSUME_NONNULL_END
