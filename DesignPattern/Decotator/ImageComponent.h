//
//  ImageComponent.h
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageComponent <NSObject>

// We will intercept these
// UIImage methods and add
// additional behavior
@optional
- (void) drawAsPatternInRect:(CGRect)rect;
- (void) drawAtPoint:(CGPoint)point;
- (void) drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void) drawInRect:(CGRect)rect;
- (void) drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

@end
