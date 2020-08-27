//
//  CabDriver.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
// 出租车司机

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Taximeter.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CabDriver : NSObject

- (void) driveToLocation:(CGPoint) x;

@end

NS_ASSUME_NONNULL_END
