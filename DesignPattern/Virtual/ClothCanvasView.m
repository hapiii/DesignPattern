//
//  ClothCanvasView.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImage *backgroundImage = [UIImage imageNamed:@"cloth"];
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
        [self addSubview:backgroundView];
    }
    
    return self;
}

@end
