//
//  ChasingGame.h
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChasingGame : NSObject

- (Character *) createPlayer:(CharacterBuilder *) builder;
- (Character *) createEnemy:(CharacterBuilder *) builder;

@end

NS_ASSUME_NONNULL_END
