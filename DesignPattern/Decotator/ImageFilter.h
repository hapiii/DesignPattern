//
//  ImageFilter.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageComponent.h"
#import "UIImage+ImageComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageFilter : NSObject <ImageComponent>
{
  @private
  id <ImageComponent> component_;
}
///image对象
@property (nonatomic, retain) id <ImageComponent> component;

- (void) apply;
- (id) initWithImageComponent:(id <ImageComponent>) component;
- (id) forwardingTargetForSelector:(SEL)aSelector;


// overridden methods in UIImage APIs
- (void) drawAsPatternInRect:(CGRect)rect;
- (void) drawAtPoint:(CGPoint)point;
- (void) drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void) drawInRect:(CGRect)rect;
- (void) drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
 

@end

NS_ASSUME_NONNULL_END
