//
//  FlyweightView.m
//  DesignPattern
//
//  Created by hapii on 2020/8/31.
//  Copyright © 2020 hapii. All rights reserved.
//


#import "FlyweightView.h"
#import "ExtrinsicFlowerState.h"

@implementation FlyweightView

extern NSString *FlowerObjectKey, *FlowerLocationKey;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    for (ExtrinsicFlowerState *state in _flowerList)
    {
        UIView *view = state.flowerView;
        if (view) {
//            UIView *flowerView = state.flowerView;
            CGRect area = state.area;
            [view drawRect:area];
        }else {
            NSLog(@"出错了");
        }
        
        
        
    }
    
}



@end
