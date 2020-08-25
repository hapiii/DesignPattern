//
//  ScribbleThumbnailView.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "ScribbleSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailView : UIView <ScribbleSource>
{
  @protected
  NSString *imagePath_;
  NSString *scribblePath_;
}
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) Scribble *scribble;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *scribblePath;

@end

NS_ASSUME_NONNULL_END
