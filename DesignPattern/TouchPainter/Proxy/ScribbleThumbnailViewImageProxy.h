//
//  ScribbleThumbnailViewImageProxy.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ScribbleThumbnailView.h"
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView{
  @private
  Scribble *scribble_;
  Command *touchCommand_;
  UIImage *realImage_;
  BOOL loadingThreadHasLaunched_;
}

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) Scribble *scribble;
@property (nonatomic, strong) Command *touchCommand;

@end

NS_ASSUME_NONNULL_END
