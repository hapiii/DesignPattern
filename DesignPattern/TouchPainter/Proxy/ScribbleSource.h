//
//  ScribbleSource.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ScribbleSource

- (Scribble *) scribble;

@end


NS_ASSUME_NONNULL_END
