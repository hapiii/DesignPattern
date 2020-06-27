//
//  Character.h
//  DesignPattern
//
//  Created by hapii on 2020/6/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject{
    @private
    float protection_;
    float power_;
    float strength_;
    float stamina_;
    float intelligence_;
    float agility_;
    float aggressiveness_;
}
///防御
@property (nonatomic, assign) float protenction;
///攻击
@property (nonatomic, assign) float power;
///力量
@property (nonatomic, assign) float strength;
///耐力
@property (nonatomic, assign) float stamina;
///智力
@property (nonatomic, assign) float intelligence;
///敏捷
@property (nonatomic, assign) float agility;
///攻击力
@property (nonatomic, assign) float aggressiveness;

@end

NS_ASSUME_NONNULL_END
