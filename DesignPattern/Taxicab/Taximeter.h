//
//  Taximeter.h
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
// 计价器

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Taximeter : NSObject
///开始
- (void) start;
///停止
- (void) stop;

@end

NS_ASSUME_NONNULL_END
