//
//  Dot.h
//  DesignPattern
//
//  Created by hapii on 2020/1/11.
//  Copyright © 2020 hapii. All rights reserved.
// 点

#import "Vertex.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dot : Vertex
{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;

- (id)copyWithZone:(NSZone *)zone;

@end

NS_ASSUME_NONNULL_END
