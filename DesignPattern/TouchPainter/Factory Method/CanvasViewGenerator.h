//
//  CanvasViewGenerator.h
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CanvasView;

NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect )aFrame;

@end

NS_ASSUME_NONNULL_END
