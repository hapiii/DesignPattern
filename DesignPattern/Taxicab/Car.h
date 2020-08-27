//
//  Car.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

///松刹车
- (void) releaseBrakes;
///换挡
- (void) changeGears;
///踩油门
- (void) pressAccelerator;
///踩刹车
- (void) pressBrakes;
///停止
- (void) releaseAccelerator;

@end

NS_ASSUME_NONNULL_END
