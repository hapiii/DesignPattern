//
//  ImageTransformFilter.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ImageFilter.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageTransformFilter : ImageFilter
{
  @private
  CGAffineTransform transform_;
}

@property (nonatomic, assign) CGAffineTransform transform;

- (id) initWithImageComponent:(id <ImageComponent>)component
                    transform:(CGAffineTransform)transform;
- (void) apply;

@end

NS_ASSUME_NONNULL_END
