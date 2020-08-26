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

typedef NS_ENUM(NSInteger , ButtonTag){
    ///退出
  kButtonTagDone = 0,
    ///打开设置
  kButtonTagOpenPaletteView = 1,
///打开缩略图
  kButtonTagOpenThumbnailView = 2,
};

NS_ASSUME_NONNULL_BEGIN

@interface CoordinatingController : UIViewController

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (CoordinatingController *) sharedInstance;

- (void)requestViewChangeByObject:(id)object;

@end

NS_ASSUME_NONNULL_END
