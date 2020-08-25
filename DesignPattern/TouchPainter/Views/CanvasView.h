//
//  CanvasView.h
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

@property (nonatomic, retain) id <Mark> mark;

@end

NS_ASSUME_NONNULL_END
