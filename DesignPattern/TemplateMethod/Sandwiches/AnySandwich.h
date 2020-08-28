//
//  AnySandwich.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnySandwich : NSObject

- (void) make;

///准备面包
- (void) prepareBread;
//把面包放在盘子上
- (void) putBreadOnPlate;
///加肉
- (void) addMeat;
///加跳舞
- (void) addCondiments;
///额外步骤
- (void) extraStep;
///上餐
- (void) serve;

@end

NS_ASSUME_NONNULL_END
