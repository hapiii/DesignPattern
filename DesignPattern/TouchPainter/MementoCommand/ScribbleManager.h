//
//  ScribbleManager.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"
#import "ScribbleThumbnailViewImageProxy.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleManager : NSObject

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (NSInteger) numberOfScribbles;
- (Scribble *) scribbleAtIndex:(NSInteger)index;
- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
