//
//  CanvasViewController.h
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "CommandBarButton.h"
#import "NSMutableArray+Stack.h"

@class CanvasView,CanvasViewGenerator;

NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewController : UIViewController
{
    @private
     Scribble *scribble_;
     CanvasView *canvasView_;
     
     CGPoint startPoint_;
     UIColor *strokeColor_;
     CGFloat strokeSize_;
}

@property (nonatomic, retain) CanvasView *canvasView;
@property (nonatomic, retain) Scribble *scribble;
@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

- (void)onBarButtonHit:(id) button;

- (void)onCustomBarButtonHit:(CommandBarButton *)barButton;

- (NSInvocation *) drawScribbleInvocation;
- (NSInvocation *) undrawScribbleInvocation;

- (void) executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation;
- (void) unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation;

@end

NS_ASSUME_NONNULL_END
