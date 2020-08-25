//
//  CoordinatingController.h
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"

typedef enum{
  kButtonTagDone,
  kButtonTagOpenPaletteView,
  kButtonTagOpenThumbnailView
} ButtonTag;

NS_ASSUME_NONNULL_BEGIN

@interface CoordinatingController : UIViewController
{
  @private
  CanvasViewController *canvasViewController_;
  UIViewController *activeViewController_;
}

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (CoordinatingController *) sharedInstance;

- (void)requestViewChangeByObject:(id)object;

@end

NS_ASSUME_NONNULL_END
