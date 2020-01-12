//
//  CanvasViewController.h
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CanvasView,CanvasViewGenerator;

NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewController : UIViewController
{
    @private
    CanvasView *canvasView_;
}

@property (nonatomic, retain) CanvasView *canvasView;

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end

NS_ASSUME_NONNULL_END
